import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/server_exception.dart';
import 'package:movie_app/core/errors/server_failure.dart';
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/entities/movie.dart';

import 'movie_repository_impl_test.mocks.dart';


@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])

void main() {
  late MovieRepositoryImpl repository;
  late MovieRemoteDataSource mockMovieDataSource;

  setUp(() {
    mockMovieDataSource = MockMovieRemoteDataSource();
    repository = MovieRepositoryImpl(remoteDataSource: mockMovieDataSource);
  });

  const tQuery = 'Avengers';

  final tMovieModelList = [
    MovieModel(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    MovieModel(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/image2"),
  ];

  final tMoviesList = [
    const Movie(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    const Movie(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/image2"),
  ];

  test('should get trending movies from the remote data source', () async {
    when(mockMovieDataSource.getTrendingMovies())
        .thenAnswer((_) async => tMovieModelList);

    final result = await repository.getTrendingMovies();

    verify(mockMovieDataSource.getTrendingMovies());
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test('should get popular movies from the remote data source', () async {
    when(mockMovieDataSource.getPopularMovies())
        .thenAnswer((_) async => tMovieModelList);

    final result = await repository.getPopularMovies();

    verify(mockMovieDataSource.getPopularMovies());
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test('should search movies from the remote data source', () async {
    when(mockMovieDataSource.searchMovies(tQuery))
        .thenAnswer((_) async => tMovieModelList);

    final result = await repository.searchMovies(tQuery);

    verify(mockMovieDataSource.searchMovies(tQuery));
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test('should throw ServerFailure when the call to remote data source is unsuccessful', () async {
    when(mockMovieDataSource.getTrendingMovies())
        .thenThrow(ServerException());

    final result = await repository.getTrendingMovies();
    expect(result, isA<Left<Failure, List<Movie>>>());
  });

  test('should throw ServerFailure when the call to remote data source is unsuccessful', () async {
    when(mockMovieDataSource.getPopularMovies())
        .thenThrow(ServerException());

    final result = await repository.getPopularMovies();
    expect(result, isA<Left<Failure, List<Movie>>>());
  });

  test('should throw ServerFailure when the call to remote data source is unsuccessful', () async {
    when(mockMovieDataSource.searchMovies(tQuery))
        .thenThrow(ServerException());

    final result = await repository.searchMovies(tQuery);
    expect(result, isA<Left<Failure, List<Movie>>>());
  });
}
