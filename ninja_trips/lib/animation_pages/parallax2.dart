import 'package:flutter/material.dart';

import 'package:animations/data/destination_data.dart';

class Parallax2 extends StatefulWidget {
  const Parallax2({Key? key}) : super(key: key);

  @override
  _Parallax2State createState() => _Parallax2State();
}

class _Parallax2State extends State<Parallax2> {
  late PageController pageController;
  double offset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.6);
    pageController.addListener(() {
      setState(() {
        offset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: pageController,
        itemCount: hotDestination.length,
        itemBuilder: (context, index) {
          return ParallaxContainer(
              index: index.toString(),
              offset: offset,
              i: index.toDouble(),
              text: hotDestination[index]['placeName']!,
              imagePath: hotDestination[index]['imagePath']!);
        },
      ),
    );
  }
}

class ParallaxContainer extends StatefulWidget {
  const ParallaxContainer({
    Key? key,
    required this.index,
    required this.offset,
    required this.i,
    required this.text,
    required this.imagePath,
  }) : super(key: key);
  final String index;
  final double offset;
  final double i;
  final String text;
  final String imagePath;
  @override
  _ParallaxContainerState createState() => _ParallaxContainerState();
}

class _ParallaxContainerState extends State<ParallaxContainer> {
  double bottomPad = 40.0;
  double topPad = 0.0;
  double horiPad = 25.0;
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        left: horiPad,
        right: horiPad,
        bottom: bottomPad,
        top: topPad,
      ),
      duration: const Duration(milliseconds: 150),
      child: Stack(
        children: [
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      //THIS DECORATION WILL HELP US TO GIVE THE NICE GRADIENT ABOVE THE IMAGE...
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x00000000),
                            Color(0x00000000),
                            Color(0xff000000),
                          ],
                        ),
                      ),
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment(
                            0.0, -((widget.offset.abs() + 0.4) - widget.i)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 35.0),
              height: 110.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          (widget.index == '0')
              ? OverflowBox(
                  minWidth: 0.0,
                  maxWidth: 200.0,
                  minHeight: 0.0,
                  maxHeight: 100.0,
                  alignment: const Alignment(0.0, -1.45),
                  child: Column(
                    children: const [
                      Text(
                        'GREAT PLACES',
                        style: TextStyle(fontSize: 16.0, color: Colors.blue),
                      ),
                      Text(
                        'Coming Soon',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
