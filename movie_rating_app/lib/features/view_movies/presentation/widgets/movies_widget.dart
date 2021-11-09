import 'package:flutter/material.dart';

import 'package:movie_rating_app/features/view_movies/presentation/controller/movie_controller.dart';
import 'package:movie_rating_app/features/view_movies/presentation/widgets/movie_tile.dart';

class MoviesWidget extends StatefulWidget {
  const MoviesWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MovieController controller;
  @override
  _MoviesWidgetState createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      pageSnapping: true,
      itemCount: widget.controller.listMovie.length,
      itemBuilder: (_, index) {
        final movie = widget.controller.listMovie[index];
        return MovieTile(
            imgUrl: movie.poster_path,
            movieName: movie.title,
            movieRating: movie.vote_average.toString(),
            movieOverview: movie.overview);
      },
    );
  }
}
