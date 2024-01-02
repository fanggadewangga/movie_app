part of 'search_movies_bloc.dart';

@immutable
abstract class SearchMoviesState {}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesSuccess extends SearchMoviesState {
  final List<Movie> movies;

  SearchMoviesSuccess(this.movies);
}

class SearchMoviesError extends SearchMoviesState {
  final String message;

  SearchMoviesError(this.message);
}
