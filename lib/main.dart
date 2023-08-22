import 'package:film_app/screens/film_details/cubit.dart';
import 'package:film_app/screens/films/cubit.dart';
import 'package:film_app/screens/films/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilmsCubit()),
        BlocProvider(create: (context) => FilmDetailsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blueGrey,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        home: const FilmView(),
      ),
    );
  }
}

