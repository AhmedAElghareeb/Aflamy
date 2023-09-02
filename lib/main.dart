import 'package:film_app/screens/movie_details/cubit.dart';
import 'package:film_app/screens/movies/cubit.dart';
import 'package:film_app/screens/movies/view.dart';
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
        BlocProvider(create: (context) => MoviesCubit()),
        BlocProvider(create: (context) => MovieDetailsCubit()),
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
        home: const MoviesView(),
      ),
    );
  }
}

