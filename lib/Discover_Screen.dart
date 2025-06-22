import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmovies/Movie_View_Screen.dart';
import 'package:quickmovies/Movie_View_Screen2.dart';
import 'package:quickmovies/controllers/Latest_movie_controller.dart';
import 'package:quickmovies/controllers/Popular_Series_Controller.dart';
import 'package:quickmovies/controllers/Popular_movie_controller.dart';
import 'package:quickmovies/controllers/Tv_Series_Controller.dart';
import 'package:quickmovies/controllers/Upcoming_Controller.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  PopularMovieController popularMovieController =
      Get.put(PopularMovieController());
  LatestMovieController latestMovieController =
      Get.put(LatestMovieController());
  TvSeriesController tvSeriesController = Get.put(TvSeriesController());
  PopularSeriesController popularSeriesController =
      Get.put(PopularSeriesController());
  UpcomingController upcomingController = Get.put(UpcomingController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Find Movies, TV series,\nand more..",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SearchBar(
                  leading: Icon(Icons.search, color: Colors.white),
                  backgroundColor:
                      WidgetStateProperty.all(Color.fromARGB(255, 27, 29, 43)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  hintText: "Search...",
                  hintStyle: WidgetStateProperty.all(
                    TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  textStyle:
                      WidgetStateProperty.all(TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 10),
            dividerHeight: 0,
            indicatorPadding: EdgeInsets.symmetric(vertical: 5),
            isScrollable: true,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(width: 3, color: Colors.deepOrangeAccent.shade100),
              insets: EdgeInsets.only(left: 0, right: 30),
            ),
            tabAlignment: TabAlignment.center,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.deepOrangeAccent.shade200,
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            tabs: [
              Tab(text: "Latest"),
              Tab(text: "Popular"),
              Tab(text: "Tv Series"),
              Tab(text: "Popular Series"),
              Tab(text: "Upcoming"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Latest Movies
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 products per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.7, // Tweak height
                ),
                itemCount: latestMovieController.latestmovie.length,
                itemBuilder: (context, index) {
                  final latestmovie = latestMovieController.latestmovie[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MovieViewScreen(movieId: latestmovie.id)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w200${latestmovie.posterPath}' ??
                                    '',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              latestmovie.title, // title
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Popular Movies
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 products per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.7, // Tweak height
                ),
                itemCount: popularMovieController.popularmovies.length,
                itemBuilder: (context, index) {
                  final popularmovie =
                      popularMovieController.popularmovies[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MovieViewScreen(movieId: popularmovie.id)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w200${popularmovie.posterPath}' ??
                                    '',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              popularmovie.title, // title
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Tv Series
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 products per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.7, // Tweak height
                ),
                itemCount: tvSeriesController.tvseries.length,
                itemBuilder: (context, index) {
                  final tvseries = tvSeriesController.tvseries[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MovieViewScreen2(movieId: tvseries.id)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w200${tvseries.posterPath}' ??
                                    '',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              tvseries.name, // title
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Popular Series
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 products per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.7, // Tweak height
                ),
                itemCount: popularSeriesController.popularseries.length,
                itemBuilder: (context, index) {
                  final popularseries =
                      popularSeriesController.popularseries[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MovieViewScreen2(movieId: popularseries.id)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w200${popularseries.posterPath}' ??
                                    '',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              popularseries.title, // title
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Upcoming Movies
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 products per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.7, // Tweak height
                ),
                itemCount: upcomingController.upcomingmovies.length,
                itemBuilder: (context, index) {
                  final upcomingmovie =
                      upcomingController.upcomingmovies[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MovieViewScreen2(movieId: upcomingmovie.id)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w200${upcomingmovie.posterPath}' ??
                                    '',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              upcomingmovie.title, // title
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
