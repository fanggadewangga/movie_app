part of 'trending_movies_bloc.dart';

@immutable
abstract class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}
class TrendingMoviesLoading extends TrendingMoviesState {}
class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<Movie> movies;
  TrendingMoviesSuccess(this.movies);
}
class TrendingMoviesError extends TrendingMoviesState {
  final String message;
  TrendingMoviesError(this.message);
}

