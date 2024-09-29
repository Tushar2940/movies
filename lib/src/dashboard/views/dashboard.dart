import 'package:flutter/material.dart';
import 'package:movies/core/extension/string_date_extension.dart';
import 'package:movies/src/dashboard/bloc/movie_bloc.dart';
import 'package:movies/src/dashboard/widget/movie_card.dart';
import 'package:movies/utils/debouncer.dart';
import 'package:movies/utils/network_utils.dart';
import 'package:movies/utils/toast_utils.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);
  MovieBloc movieBloc = MovieBloc();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      movieBloc.add(FetchMoreMovies(query: _searchController.text));
    }
  }

  Future<void> _checkInternetConnection() async {
    bool hasConnection = await InternetUtil.hasInternetConnection();
    if (!hasConnection) {
      notify("No Internet", ToastificationType.error);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => movieBloc,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  decoration: const InputDecoration(labelText: "Search Movies"),
                  onTapOutside: (event) =>
                      FocusScope.of(context).requestFocus(FocusNode()),
                  onChanged: (value) {
                    if (value.length > 3) {
                      _debouncer.run(() {
                        movieBloc.add(
                          FetchMovies(query: _searchController.text),
                        );
                      });
                    }
                  },
                ),
                Expanded(
                  child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      if (state is MovieLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is MovieLoaded) {
                        final movies = state.movies;
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                          child: GridView.builder(
                            controller: _scrollController,
                            cacheExtent: 5000,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .6,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: state is LoadMoreMovie
                                ? movies.length + 1
                                : movies.length,
                            itemBuilder: (context, index) {
                              if (index < movies.length) {
                                final movie = movies[index];
                                return MovieCard(
                                  key: ValueKey(movie.id),
                                  movie: movie,
                                  onTap: () {
                                    // Handle card tap here
                                  },
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        );
                      } else if (state is MovieError) {
                        return Center(
                          child: Text(
                            //"Please Try Again",
                            state.message,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return const Center(child: Text('Start searching!'));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
