import 'package:flutter/material.dart';
import 'package:my_trainings_app/Modules/Utilities/app_text_style.dart';

import 'Modules/Utilities/app_colors.dart';
import 'Modules/home_module/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Training App',
      theme: ThemeData(
        fontFamily: 'DMSerifText',
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.white),
          titleTextStyle: white18w700,
          centerTitle: true
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: TrainingScreen(),
    );
  }
}
