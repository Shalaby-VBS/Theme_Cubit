import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_cubit/constants.dart';
import 'package:theme_cubit/enums/theme_state.dart';
import 'package:theme_cubit/logic/app_theme_cubit.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit()..changeTheme(ThemeStates.initial),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Theme Cubit',
            debugShowCheckedModeBanner: false,
            theme: state is LightTheme ? ThemeData.light() : ThemeData.dark(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
