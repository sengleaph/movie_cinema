import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/response/status.dart';
import '../../../view_model/snake_viewmodel/snake_viewmodel.dart';
import 'widget/food_cart.dart';

class ListFoodPage extends StatefulWidget {
  const ListFoodPage({super.key});

  @override
  State<ListFoodPage> createState() => _ListFoodPageState();
}

class _ListFoodPageState extends State<ListFoodPage> {
  final _snakeViewModel = SnakeViewModel();

  @override
  void initState() {
    super.initState();
    _snakeViewModel.getAllSnakes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => _snakeViewModel,
        child: Consumer<SnakeViewModel>(
          builder: (context, viewModel, _) {
            switch (viewModel.response.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.COMPLETED:
                final snakeList = viewModel.response.data?.rows ?? [];
                return ListView.builder(
                  itemCount: snakeList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListFoodCart(snakeData: snakeList[index]),
                    );
                  },
                );
              case Status.ERROR:
                debugPrint(viewModel.response.message);
                return Center(
                  child: Text("Error: ${viewModel.response.message}"),
                );
              default:
                return const Center(child: Text("No Data"));
            }
          },
        ),
      ),
    );
  }
}
