
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';

import '../../../domain/entities/movie.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies popularMovies;

  PopularMoviesBloc(this.popularMovies) : super(PopularMoviesInitial()) {
    on<PopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesLoading());
      final result = await popularMovies.call();
      result.fold((failure) => emit(PopularMoviesError(failure.toString())), (movies) => emit(PopularMoviesSuccess(movies)));
    });
  }
}
