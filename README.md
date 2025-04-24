# City-Helper-System
A Flutter application providing city navigation and local information services with Google Maps integration.

## Project Structurue
```
lib/
├── src/
│   ├── features/
│   │   ├── location/
│   │   ├── maps/
│   │   └── navigation/
│   ├── core/
│   │   ├── constants/
│   │   ├── widgets/
│   │   └── utils/
│   └── app.dart
└── main.dart
```

## Prerequisites
- Flutter SDK (3.29.0)
- Dart SDK (3.7.0)
- Google Maps API key

## Setup
```bash
git clone https://github.com/Bilawal-Mehfooz-Malik/City-Helper-System.git
cd City-Helper-System\app
flutter pub get
```

Create `.env` file at the root of the app folder and add the following environment variables:
```env
GOOGLE_MAPS_KEY=your_api_key
```

also add `MAPS_API_KEY` in `local.properties` file that is available in `app\android\local.properties`:
```properties
MAPS_API_KEY=your_api_key
```

Generate the required files by running this command in terminal:
```bash
dart run build_runner build -d
```

Now you can run your app by using this command:
```bash
flutter run
```
