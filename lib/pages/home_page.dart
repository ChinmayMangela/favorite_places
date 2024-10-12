import 'package:favorite_places/main.dart';
import 'package:favorite_places/pages/add_new_place_page.dart';
import 'package:favorite_places/utils/utils.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Your Places'),
      actions: [
        _buildAddButton(),
      ],
    );
  }

  Widget _buildBody() {
    return const PlacesList();
  }

  Widget _buildAddButton() {
    return IconButton(
      onPressed: () {
        navigatorKey.currentState!.pushNamed('/addNewPlacePage');
      },
      icon: const Icon(Icons.add),
    );
  }
}
