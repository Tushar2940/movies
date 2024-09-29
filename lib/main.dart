import 'package:flutter/material.dart';
import 'package:movies/core/res/theme/theme.dart';
import 'package:movies/core/services/router.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Movies',
        routerConfig: router,
        theme: MTheme.lightTheme,
        darkTheme: MTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}

