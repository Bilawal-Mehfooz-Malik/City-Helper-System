import 'package:app/src/core/exceptions/app_exceptions.dart';
import 'package:app/src/features/startup/data/real/location_search_repository.dart';
import 'package:app/src/features/startup/domain/place_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late MockDio mockDio;
  late LocationSearchRepository searchRepo;

  setUp(() {
    mockDio = MockDio();
    searchRepo = LocationSearchRepository(mockDio);
  });

  group('fetchSuggestions', () {
    // Sample Data for fetching suggestions.
    const query = 'test';
    const url = 'https://places.googleapis.com/v1/places:autocomplete';

    final suggestionData = {
      "placePrediction": {
        "placeId": "TEST_ID_1",
        "structuredFormat": {
          "mainText": {"text": "Test Place"},
          "secondaryText": {"text": "Test Address"}
        }
      }
    };
    test('1. returns a list of PlaceSuggestion on valid response', () async {
      // setup
      final suggestionsResponse = Response(
        data: {
          'suggestions': [suggestionData]
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );
      when(
        () => mockDio.post<Map<String, Object?>>(
          url,
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async => suggestionsResponse);

      // run
      final result = await searchRepo.fetchSuggestions(query);

      // verify
      expect(result.first.id, 'TEST_ID_1');
      expect(result.first.name, 'Test Place');
      expect(result.first.streetAddress, 'Test Address');
    });

    test('2. returns a empty list of PlaceSuggestion', () async {
      // setup
      final suggestionsResponse = Response(
        data: {'suggestions': <PlaceSuggestion>[]},
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );
      when(() => mockDio.post<Map<String, Object?>>(
            url,
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenAnswer((_) async => suggestionsResponse);

      // Run
      final result = await searchRepo.fetchSuggestions(query);

      // Verify
      expect(result, isEmpty);
    });

    test('3. throws NetworkException on NoInternet', () async {
      // setup
      when(() => mockDio.post<Map<String, Object?>>(
            url,
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: url),
          response: Response(
            data: {'error': 'Invalid request'},
            statusCode: 400,
            requestOptions: RequestOptions(path: url),
          ),
        ),
      );

      // run & verify
      expect(
        () => searchRepo.fetchSuggestions(query),
        throwsA(isA<NetworkException>()),
      );
    });
  });

  group('fetchPlaceDetails', () {
    const detailsUrl = 'https://places.googleapis.com/v1/places/TEST_ID_1';
    final mockSuggestion = PlaceSuggestion(
      id: 'TEST_ID_1',
      name: 'Test Place',
      streetAddress: 'Test Address',
    );
    final validPlaceDetails = {
      "location": {
        "latitude": 33.1401,
        "longitude": 73.7490,
      },
      "formattedAddress": "Test Address",
    };

    test('1. success: returns Place with valid details', () async {
      // setup
      when(() => mockDio.get<Map<String, Object?>>(
            detailsUrl,
            options: any(named: 'options'),
          )).thenAnswer((_) async => Response(
            data: validPlaceDetails,
            statusCode: 200,
            requestOptions: RequestOptions(path: detailsUrl),
          ));

      // run
      final result = await searchRepo.fetchPlaceDetails(mockSuggestion);

      // verify
      expect(result.geoLocation!.latitude, 33.1401);
      expect(result.geoLocation!.longitude, 73.7490);
      expect(result.streetAddress, 'Test Address');
    });

    test('2. throws LocationFetchFailedException on Dio error', () async {
      // setup
      when(() => mockDio.get<Map<String, Object?>>(
            detailsUrl,
            options: any(named: 'options'),
          )).thenThrow(DioException(
        requestOptions: RequestOptions(path: detailsUrl),
        response: Response(
          data: {'error': 'Not found'},
          statusCode: 404,
          requestOptions: RequestOptions(path: detailsUrl),
        ),
      ));

      // run & verify
      expect(
        () => searchRepo.fetchPlaceDetails(mockSuggestion),
        throwsA(isA<NetworkException>()),
      );
    });

    test('3. throws [MissingLatitudeException] on missing location', () async {
      // setup
      final invalidResponse = {
        "formattedAddress": "Test Address",
        "location": {"latitude": null, "longitude": null},
      };

      when(() => mockDio.get<Map<String, Object?>>(
            detailsUrl,
            options: any(named: 'options'),
          )).thenAnswer((_) async => Response(
            data: invalidResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: detailsUrl),
          ));

      // run & verify
      expect(
        () => searchRepo.fetchPlaceDetails(mockSuggestion),
        throwsA(isA<MissingLatitudeException>()),
      );
    });
  });
}
