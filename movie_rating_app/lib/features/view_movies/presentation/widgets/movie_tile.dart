import 'package:flutter/material.dart';
import 'package:movie_rating_app/features/view_movies/presentation/widgets/expanded_conetnt_widget.dart';
import 'package:movie_rating_app/features/view_movies/presentation/widgets/image_widget.dart';

class MovieTile extends StatefulWidget {
  const MovieTile({
    Key? key,
    required this.imgUrl,
    required this.movieName,
    required this.movieRating,
    required this.movieOverview,
  }) : super(key: key);
  final String imgUrl;
  final String movieName;
  final String movieRating;
  final String movieOverview;
  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: isExpanded ? 60 : 100,
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.55 : size.height * 0.5,
            child: ExpandedContentWidget(
              movieRating: widget.movieRating,
              movieName: widget.movieName,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: isExpanded ? 150 : 100,
            child: GestureDetector(
              onPanUpdate: onPanUpdate,
              onTap: () {
                setState(() {
                  isExpanded = true;
                });
              },
              child: ImageWidget(
                imageUrl: widget.imgUrl,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
