import 'package:banking_app/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/cinema_viewmodel/cinema_viewmodel.dart';
import '../component/search_widget.dart';
import 'widget/cinema_cart.dart'; // Ensure the path is correct for 'TextFieldSearch'

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _cinemaViewModel = CinemaViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cinemaViewModel.getAllCinemas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              backgroundColor: Color(0xFF303030),
              pinned: true,
              floating: true,
              snap: true,
              title: Text(
                "Location",
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFieldSearch(
                    hintText: "Search here...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            )
          ];
        },
        body: ChangeNotifierProvider(
          create: (BuildContext context) => _cinemaViewModel,
          child: Consumer<CinemaViewModel>(
            builder: (context, viewModel, _) {
              switch (viewModel.cinemaList.status) {
                case Status.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.COMPLETED:
                  final cinema = viewModel.cinemaList.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.only(
                        bottom: 16.0), // Add padding for spacing at the bottom
                    itemCount: 5, // Number of items to show in the list
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: CinemaCart(
                            cinemaModel: cinema[
                                index]), // Use 'const' for optimization if CinemaCart is static
                      );
                    },
                  );
                case Status.ERROR:
                  print(viewModel.cinemaList.message);
                  return Center(
                    child: Text("Error: ${viewModel.cinemaList.message}"),
                  );
                default:
                  return const Center(
                    child: Text("No Data"),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
