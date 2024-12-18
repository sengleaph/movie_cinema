import 'package:flutter/material.dart';

import '../../../model/cinema/cinema_model.dart';

class CinemaCart extends StatelessWidget {
  CinemaModel? cinemaModel;
  CinemaCart({super.key, required this.cinemaModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(cinemaModel!.bannerImageUrl ?? '')),
          const SizedBox(height: 15,),
          Text(cinemaModel!.name ?? '',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(cinemaModel!.address1 ?? '', style: const TextStyle(fontSize: 16)),
            ],
          )
        ],
      ),
    );
  }
}
