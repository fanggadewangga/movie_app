part of 'search_movies_bloc.dart';

@immutable
abstract class SearchMoviesEvent {}

class FetchSearchMovies extends SearchMoviesEvent {
  final String query;

  FetchSearchMovies(this.query);
}
