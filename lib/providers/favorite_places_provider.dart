import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class FavoritePlacesProvider extends ChangeNotifier {

  final List<Place> _places = [];

  List<Place> get places => _places;

  void addPlace(Place place) {
    _places.add(place);
    notifyListeners();
  }
}