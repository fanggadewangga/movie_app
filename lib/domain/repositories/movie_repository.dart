import 'package:movie_app/domain/entities/movie.dart';

import '../../core/errors/server_failure.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure, List<Movie>>> getTrendingMovies();

  Future<Either<ServerFailure, List<Movie>>> searchMovies(String query);

  Future<Either<ServerFailure, List<Movie>>> getPopularMovies();
}
