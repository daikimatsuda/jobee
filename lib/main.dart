import 'package:flutter/material.dart';
import 'core/_core.dart';
import 'core/app/app_property.dart' if (dart.library.html) 'core/app/web_app_property.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  appProperty();
  initializeDateFormatting('ja');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Thema.getThema(),
      routes: Routes.getRoutes(context),
    );
  }
}