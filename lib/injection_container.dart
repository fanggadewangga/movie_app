import 'package:get_it/get_it.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';

import 'data/datasources/movie_remote_data_source.dart';
import 'data/datasources/remote/movie_remote_data_source_impl.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_trending_movies.dart';
import 'domain/usecases/search_movies.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

void init() {
    // Bloc
    getIt.registerFactory(() => PopularMoviesBloc(getIt()));
    getIt.registerFactory(() => TrendingMoviesBloc(getIt()));
    getIt.registerFactory(() => SearchMoviesBloc(getIt()));

    // Use cases
    getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
    getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
    getIt.registerLazySingleton(() => SearchMovies(getIt()));

    // Repositories
    getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));

    // Data sources
    getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client: getIt()));

    // Http service
    getIt.registerLazySingleton(() => http.Client());
}