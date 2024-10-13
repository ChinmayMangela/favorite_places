import 'package:favorite_places/providers/selected_image_provider.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void navigateToAddNewPlace(BuildContext context) {
    final selectedImageProvider = Provider.of<SelectedImageProvider>(context, listen: false);

    // Reset the image before navigation
    selectedImageProvider.selectImage(null);

    // Navigate to the AddNewPlacePage
    Navigator.of(context).pushNamed('/addNewPlacePage');
  }

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
        navigateToAddNewPlace(context);
      },
      icon: const Icon(Icons.add),
    );
  }
}
