import 'package:flutter/material.dart';

import '../../../../model/feature_movie/feature_movie.dart';

class GridMovie extends StatelessWidget {
  final MovieModel movies;
  const GridMovie({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movies.bannerImageUrl ?? " ",
                // height: 150, // Adjust height to fit within constraints
                // width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
                movies.openingDate?.toLocal().toString().split(' ')[0] ??
                  "Unknown Date",
              style: TextStyle(
                fontSize: 12, // Adjust font size for better fit
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
             Text(
              movies.title ?? '',
              style: TextStyle(
                fontSize: 15, // Adjust font size for better fit
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1, // Prevent overflow
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
