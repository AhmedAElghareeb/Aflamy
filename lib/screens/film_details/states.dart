part of 'cubit.dart';

class GetFilmDetailsStates{}

class GetFilmDetailsLoadingState extends GetFilmDetailsStates{}

class GetFilmDetailsFailedState extends GetFilmDetailsStates{
  final String msg;

  GetFilmDetailsFailedState({required this.msg});

}

class GetFilmDetailsSuccessState extends GetFilmDetailsStates{
  late MovieDetails model;

  GetFilmDetailsSuccessState({required this.model});
}