import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension AsyncValueErrorHandling on AsyncValue<Object?> {
  String get errorMessage {
    if (error is PostgrestException) {
      return (error as PostgrestException).message;
    } else if (error is SocketException) {
      return (error as SocketException).message;
    } else {
      return 'An unexpected error occurred. Please try again later';
    }
  }
}
