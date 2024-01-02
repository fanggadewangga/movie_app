import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/entities/movie.dart';

import '../../../domain/usecases/get_trending_movies.dart';

part 'trending_movies_event.dart';

part 'trending_movies_state.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {

  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc(this.getTrendingMovies) : super(TrendingMoviesInitial()) {
    on<TrendingMoviesEvent>((event, emit) async {
      emit(TrendingMoviesLoading());
      final result = await getTrendingMovies.call();
      result.fold((failure) => emit(TrendingMoviesError(failure.toString())),
          (movies) => emit(TrendingMoviesSuccess(movies)));
    });
  }
}
