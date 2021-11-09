import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: size.height * 0.5,
        width: size.width * 0.8,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Stack(
            children: [
              SizedBox.expand(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child:
                      Image.network('https://image.tmdb.org/t/p/w500$imageUrl'),
                ),
              )
            ],
          ),
        ));
  }
}
