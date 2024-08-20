import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/helpers/routes.dart';
import 'package:whatsapp_messenger/core/themes/theme.dart';

void main() {
  runApp( DevicePreview(
    enabled: true,
    builder: (context) =>const MyApp(), 
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    theme: Themes.lightTheme(),
    darkTheme: Themes.darkTheme(),
    themeMode: ThemeMode.system,
    routes: Routes.appRoutes,
    initialRoute: Routes.welcome,
    debugShowCheckedModeBanner: false,);
  }
}

