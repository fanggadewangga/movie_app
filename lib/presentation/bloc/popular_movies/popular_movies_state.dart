part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesSuccess extends PopularMoviesState {
  final List<Movie> movies;

  PopularMoviesSuccess(this.movies);
}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError(this.message);
}
