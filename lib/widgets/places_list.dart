import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:favorite_places/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritePlacesProvider>(builder: (context, placesProvider, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final currentPlace = placesProvider.places[index];
          return PlaceCard(place: currentPlace);
        },
        itemCount: placesProvider.places.length,
      );
    });
  }
}
