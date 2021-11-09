import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_rating_app/features/view_movies/presentation/controller/movie_controller.dart';
import 'package:movie_rating_app/features/view_movies/presentation/widgets/movies_widget.dart';

class HomePage extends GetView<MovieController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigation(),
        body: Obx(() {
          switch (controller.pageState()) {
            case PageState.initial:
              return const Center(
                child: Icon(Icons.search),
              );
            case PageState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PageState.loaded:
              return MoviesWidget(controller: controller);
            case PageState.failed:
              return const Center(
                  child: Icon(
                Icons.not_accessible,
              ));
          }
        }));
  }

  PreferredSizeWidget buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('INTERESTS'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_pin),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {},
        ),
      );

  Widget buildBottomNavigation() => BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      );
}
