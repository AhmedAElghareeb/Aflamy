part of 'cubit.dart';

class FilmsStates{}

class GetFilmsLoadingState extends FilmsStates{}

class GetFilmsSuccessState extends FilmsStates{
  final List<MovieModel> list;

  GetFilmsSuccessState({required this.list});
}
class GetFilmsFailedState extends FilmsStates{
  final String msg;

  GetFilmsFailedState({required this.msg});
}


class GetFilmsFromPaginationLoadingState extends FilmsStates{}
class GetFilmsFromPaginationFailState extends FilmsStates{
  final String msg;

  GetFilmsFromPaginationFailState({required this.msg});
}
