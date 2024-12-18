import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/response/status.dart';
import '../../view_model/feature_movie_viewmodel/feature_mv_vm.dart';
import '../trailler/video_trailler.dart';
import 'widget/date_picker.dart';
import 'widget/slide/slide_show.dart';
import 'widget/grid/grid_movie.dart';
import 'widget/grid/list_view_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool firstSwitchValue = false;
  // final _CineViewModel = CinemaViewModel();
  final _featureMovie = FeatureMovieViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _CineViewModel.getAllCinemas();
    _featureMovie.getAllFeatureMovies();
  }

  Future<void> _refreshData() async {
    // await _CineViewModel.getAllCinemas();

    await _featureMovie.getAllFeatureMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Legend\nCinema",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Location Selector
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Location",
                              style: TextStyle(color: Colors.white)),
                          Icon(Icons.arrow_drop_down_sharp,
                              color: Colors.white),
                        ],
                      ),
                    ),

                    // Slideshow Section
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: ChangeNotifierProvider(
                        create: (BuildContext context) => _featureMovie,
                        child: Consumer<FeatureMovieViewModel>(
                          builder: (context, viewModel, _) {
                            switch (viewModel.movieList.status) {
                              case Status.LOADING:
                                return const Center(
                                    child: CircularProgressIndicator());
                              case Status.COMPLETED:
                                final movies = viewModel.movieList.data!;
                                return SlideShowPage(movies: movies);
                              case Status.ERROR:
                                return Center(
                                  child: Text(
                                    "Error: ${viewModel.movieList.message}",
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              default:
                                return const Center(
                                    child: Text("No Data Available"));
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Toggle Switch Section
                    AnimatedToggleSwitch<bool>.size(
                      current: firstSwitchValue,
                      values: [false, true],
                      iconOpacity: 0.3,
                      indicatorSize: const Size.fromWidth(double.infinity),
                      customIconBuilder: (context, local, global) => Text(
                        local.value ? 'Coming Soon' : 'On Show',
                        style: TextStyle(
                          color: Color.lerp(
                              Colors.white, Colors.white, local.animationValue),
                        ),
                      ),
                      borderWidth: 3.0,
                      iconAnimationType: AnimationType.onSelected,
                      styleBuilder: (value) => ToggleStyle(
                        indicatorColor: Colors.red.shade400,
                        borderColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onChanged: (value) {
                        setState(() {
                          firstSwitchValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    // Date Picker Section
                    // Date Picker Section
                    SizedBox(
                      height: 90,
                      child: WeekDaysPicker(
                        initialDate: DateTime.now(),
                        onDateChanged: (date) {
                          debugPrint('Selected date: $date');
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    // GridView Section
                    const Text(
                      "Show All",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ChangeNotifierProvider(
                      create: (BuildContext context) => _featureMovie,
                      child: Consumer<FeatureMovieViewModel>(
                        builder: (context, viewModel, _) {
                          switch (viewModel.movieList.status) {
                            case Status.LOADING:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );

                            case Status.COMPLETED:
                              final movies = viewModel.movieList.data!;
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 7.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio:
                                      0.55, // Adjust for better fit
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    8, // Dynamically set based on the number of movies
                                itemBuilder: (context, index) {
                                  final movie = movies[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigate and pass the selected movie's trailerUrl
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TraillerMovie(
                                            trailerUrl: movie.trailerUrl ?? '', // Pass the trailer URL here
                                          ),
                                        ),
                                      );
                                    },
                                    child: GridMovie(
                                      movies: movie,
                                    ),
                                  );

                                },
                              );

                            case Status.ERROR:
                              return Center(
                                child: Text(
                                  "Error: ${viewModel.movieList.message}",
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );

                            default:
                              return const Center(
                                child: Text("No Data Available"),
                              );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Ads Section
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Ads",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        .339, // Constrain height for ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return const ListViewAds();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
