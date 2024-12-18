import 'package:flutter/material.dart';

import '../../../model/cinema/cinema_model.dart';

class CartListCinema extends StatelessWidget {
  CinemaModel? cinemaModel;
  CartListCinema({super.key, required this.cinemaModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                     cinemaModel!.bannerImageUrl ?? '',
                      width: 100,
                      height: 200,
                      fit: BoxFit.fill)),
            ),
            const SizedBox(width: 10,),
            Expanded(child: Text(cinemaModel!.name ?? '')),
          ],
        ),
      ),
    );
  }
}
