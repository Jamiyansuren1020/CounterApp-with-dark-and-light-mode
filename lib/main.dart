import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/theme_cubit.dart' as app;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => app.ThemeCubit()),
      ],
      child: BlocBuilder<app.ThemeCubit, app.ThemeMode>(
        builder: (context, themeMode) {
          // Ensure themeMode is not null before using it
            final ThemeData? themeData = themeMode == app.ThemeMode.light
                ? ThemeData.light()
                : themeMode == app.ThemeMode.dark
                    ? ThemeData.dark()
                    : null;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Counter App with Dark Mode',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeData != null ? ThemeMode.light : ThemeMode.dark,
            home: const CounterPage(),
          );
        },
      ),
    );
  
}

