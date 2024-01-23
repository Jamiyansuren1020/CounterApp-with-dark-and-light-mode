import 'package:bloc/bloc.dart';


// abstract class ThemeData {
//   ThemeData();
// }
// Events
enum ThemeEvent { toggle }

// State
enum ThemeMode { light, dark }

// Cubit
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
