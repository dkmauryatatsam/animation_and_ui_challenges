import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedContentWidget extends StatelessWidget {
  const ExpandedContentWidget({
    Key? key,
    required this.movieRating,
    required this.movieName,
  }) : super(key: key);
  final String movieRating;
  final String movieName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            movieName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(movieRating),
              const SizedBox(width: 2),
              const Icon(
                Icons.star,
                color: Colors.yellow,
              )
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
