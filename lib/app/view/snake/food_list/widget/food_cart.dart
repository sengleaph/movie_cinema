import 'package:flutter/material.dart';

import '../../../../model/snake/snake_model.dart';

class ListFoodCart extends StatelessWidget {
  SnakeData? snakeData;
  ListFoodCart({super.key, required this.snakeData});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.grey)),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(snakeData!.bannerImageUrl ?? " ", width: 100,
                height: 200,
                fit: BoxFit.cover)),
        ),
    SizedBox(width: 10,),
    Expanded(child: Text(snakeData!.description ?? '')),
      ],
    ),
    );
  }
}
