import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/popular_movies/popular_movies_bloc.dart';
import '../bloc/trending_movies/trending_movies_bloc.dart';
import 'movies_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Fabrice 👋',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'TDD - Movie App',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trending Movies
              const Text('Trending Movies',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                builder: (context, state){
                  if(state is TrendingMoviesLoading){
                    return const CircularProgressIndicator();
                  } else if(state is TrendingMoviesSuccess){
                    return MoviesList(movies: state.movies);
                  } else if (state is TrendingMoviesError){
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

              const SizedBox(height: 20,),
              // Popular Movies
              const Text('Popular Movies',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state){
                  if(state is PopularMoviesLoading){
                    return const CircularProgressIndicator();
                  } else if(state is PopularMoviesSuccess){
                    return MoviesList(movies: state.movies);
                  } else if (state is PopularMoviesError){
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}