import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_cubit/enums/theme_state.dart';
import 'package:theme_cubit/logic/app_theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme Cubit'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AppThemeCubit>(context)
                        .changeTheme(ThemeStates.dark);
                  },
                  child: const Text('Dark Theme')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AppThemeCubit>(context)
                        .changeTheme(ThemeStates.light);
                  },
                  child: const Text('Light Theme')),
            ],
          ),
        ));
  }
}
