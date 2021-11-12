import 'package:animations/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Parallax1 extends StatefulWidget {
  const Parallax1({Key? key}) : super(key: key);

  @override
  _Parallax1State createState() => _Parallax1State();
}

class _Parallax1State extends State<Parallax1> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 30),
                Text(
                  'Vincent\nvan Gogh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '30 March 1853-29 July 1890',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Vincent Willem van Gogh was a Dutch post-impressionist painter who posthumously became one of the most famous and influential figures in the history of Western art.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  'Highlight Paintings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 400,
                padding: const EdgeInsets.only(bottom: 30),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: paintings.length,
                  itemBuilder: (context, i) {
                    return Transform.scale(
                      scale: 1,
                      child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                paintings[i]['image'],
                                height: 370,
                                fit: BoxFit.cover,
                                alignment: Alignment(-pageOffset.abs() + i, 0),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 20,
                              right: 10,
                              child: Text(
                                paintings[i]['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
