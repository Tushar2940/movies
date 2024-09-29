part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();
}

class FetchMovies extends MovieEvent {
  final String query;
  const FetchMovies({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}

class FetchMoreMovies extends MovieEvent {
  final String query;
  const FetchMoreMovies({required this.query});

  @override
  List<Object?> get props => [query];
}