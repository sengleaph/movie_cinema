import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../view_model/cinema_viewmodel/cinema_viewmodel.dart';
import 'food_list/list_food.dart';
import 'widget/cart_cinema.dart';

class SnakePage extends StatefulWidget {
  const SnakePage({super.key});

  @override
  State<SnakePage> createState() => _SnakePageState();
}

class _SnakePageState extends State<SnakePage> {
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
        appBar: AppBar(
          title: const Text("Snake"),
        ),
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
                      itemCount: cinema.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ListFoodPage(),));
                            },
                              child:
                                  CartListCinema(cinemaModel: cinema[index])),
                        );
                      });
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
        ));
  }
}
