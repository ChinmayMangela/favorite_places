import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key, required this.place,});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(place.name),
    );
  }
}
