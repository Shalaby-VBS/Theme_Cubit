import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_cubit/constants.dart';
import 'package:theme_cubit/enums/theme_state.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(ThemeInitial());

  changeTheme(ThemeStates state) {
    switch (state) {
      case ThemeStates.initial:
        if (sharedPreferences!.getString('appTheme') != null) {
          if (sharedPreferences!.getString('appTheme') == "light") {
            emit(LightTheme());
          } else {
            emit(DarkTheme());
          }
        } else {
          emit(ThemeInitial());
        }
        emit(ThemeInitial());
        break;
      case ThemeStates.light:
        sharedPreferences!.setString('appTheme', "light");
        emit(LightTheme());
        break;
      case ThemeStates.dark:
        sharedPreferences!.setString('appTheme', "dark");
        emit(DarkTheme());
        break;
    }
  }
}
