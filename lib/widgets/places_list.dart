import 'package:favorite_places/main.dart';
import 'package:favorite_places/pages/place_details_screen.dart';
import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:favorite_places/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritePlacesProvider>(
        builder: (context, placesProvider, child) {
      return placesProvider.places.isEmpty
          ? Center(
              child: Text(
              'No Places Added Yet',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ))
          : ListView.builder(
              itemBuilder: (context, index) {
                final currentPlace = placesProvider.places[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PlaceDetailsPage(place: currentPlace),
                      ),
                    );
                  },
                  child: PlaceCard(place: currentPlace),
                );
              },
              itemCount: placesProvider.places.length,
            );
    });
  }
}
