import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galary_flutter_application/internal/application.dart';

void main() {
  runApp(const ProviderScope(child: Application()));
}