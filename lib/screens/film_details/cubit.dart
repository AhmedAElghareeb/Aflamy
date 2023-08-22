import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'states.dart';
part 'model.dart';


class FilmDetailsCubit extends Cubit<GetFilmDetailsStates>{
  FilmDetailsCubit() : super(GetFilmDetailsStates());

  Future<void> getData(int id) async {
    emit(GetFilmDetailsLoadingState());
    try {
      final response = await Dio().get("https://api.themoviedb.org/3/movie/$id?api_key=2001486a0f63e9e4ef9c4da157ef37cd");
      MovieDetails model = MovieDetails.fromJson(response.data);
      emit(GetFilmDetailsSuccessState(model: model));
    } on DioException catch(ex) {
      emit(GetFilmDetailsFailedState(msg: ex.message ?? "Failed"));
    }
  }
}