import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailsPage extends StatelessWidget {
  const PlaceDetailsPage({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(place.name),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Text(place.name),
    );
  }
}
