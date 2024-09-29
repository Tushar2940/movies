part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState(this.movies);
  final List<MovieModel> movies;

  @override
  List<Object> get props => [movies];
}

final class MovieInitial extends MovieState {
  MovieInitial() : super ([]);
}

class MovieLoading extends MovieState {MovieLoading() : super ([]);}

class MovieLoaded extends MovieState {
  const MovieLoaded({required List<MovieModel> movies}) : super (movies);

  @override
  List<Object> get props => [movies];
}

class LoadMoreMovie extends MovieState {
  const LoadMoreMovie({required List<MovieModel> movies}) : super (movies);

  @override
  List<Object> get props => [movies];
}

class MovieError extends MovieState {
  final String message;
  MovieError({required this.message}) : super ([]);

  @override
  List<Object> get props => [message];
}