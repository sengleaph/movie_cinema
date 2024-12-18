import 'package:flutter/material.dart';

class ListViewAds extends StatelessWidget {
  const ListViewAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: 400,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            child: Image.network(
                "https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/5ffe9005-beb3-41be-8e31-5afeb75c9b98.jpeg", fit: BoxFit.cover, height: 250,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("មកចូលរួមកម្មវិធី movie Uder the stars នៅផ្សាទំនើប olampia on 21-22 dec, 2024",style: TextStyle(color: Colors.black, fontSize: 16,),),
          )
        ],
      ),
    );
  }
}
