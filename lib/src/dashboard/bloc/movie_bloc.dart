import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies/src/dashboard/model/movie_model.dart';
import 'package:movies/src/dashboard/repo/dashboard_repo.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  DashboardRepository dashboardRepository = DashboardRepository();
  int currentPage = 1;
  bool isFetchingMore = false;
  ScrollController controller = ScrollController();


  MovieBloc() : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieLoading());
      try{
        var result = await dashboardRepository.searchMovie(event.query,page: currentPage);
        emit(MovieLoaded(movies: result));
      }catch(e){
        emit(MovieError(message: e.toString()));
      }
    });

    on<FetchMoreMovies>((event, emit) async{
      emit(LoadMoreMovie(movies: state.movies));
      currentPage++;
      try {
        var result = await dashboardRepository.searchMovie(
            event.query, page: currentPage);
        emit(MovieLoaded(movies: [...state.movies, ...result]));
      }catch(e){
        debugPrint(e.toString());
        emit(MovieLoaded(movies: state.movies));
      }
    });
  }
}
