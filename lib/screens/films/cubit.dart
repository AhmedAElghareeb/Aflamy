import 'package:dio/dio.dart';
import 'package:film_app/screens/films/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';


class FilmsCubit extends Cubit<FilmsStates>
{
  FilmsCubit():super(FilmsStates());

  final List<MovieModel> _list = [];

  int pageNumber = 1;

  void getMovies({bool fromPagination = false}) async {
    if(fromPagination)
    {
      emit(GetFilmsFromPaginationLoadingState());
    } else {
      emit(GetFilmsLoadingState());
    }
    try{
      var response = await Dio().get("https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$pageNumber");
      var model = FilmModel.fromJson(response.data);
      if(model.list.isNotEmpty)
      {
        pageNumber++;
        _list.addAll(model.list);
      }

      emit(GetFilmsSuccessState(list: _list));
    } on DioException catch(ex)
    {
      if(fromPagination)
      {
        emit(GetFilmsFromPaginationFailState(msg: ex.toString()));
      } else {
        emit(GetFilmsFailedState(msg: ex.toString()));
      }
    }
  }
}