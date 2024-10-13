import 'dart:io';
import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:favorite_places/providers/selected_image_provider.dart';
import 'package:favorite_places/utils/utils.dart';
import 'package:favorite_places/widgets/custom_text_field.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewPlacePage extends StatefulWidget {
  const AddNewPlacePage({super.key});

  @override
  State<AddNewPlacePage> createState() => _AddNewPlacePageState();
}

class _AddNewPlacePageState extends State<AddNewPlacePage> {
  final _titleController = TextEditingController();

  void addNewPlace() {
    final selectedImageProvider =
        Provider.of<SelectedImageProvider>(context, listen: false);
    final nameOfPlace = _titleController.text.trim();
    File? image = selectedImageProvider.selectedImage;
    if (nameOfPlace.isEmpty) {
      Utils.showSnackBar('Enter name');
      return;
    }

    if(image == null) {
      Utils.showSnackBar('Please select an image');
      return;
    }

    final favoritePlaceProvider =
        Provider.of<FavoritePlacesProvider>(context, listen: false);
    final favoritePlace = Place(name: nameOfPlace, image: image);
    favoritePlaceProvider.addPlace(favoritePlace);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
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
      title: const Text('Add a new place'),
    );
  }

  Widget _buildBody() {
    final screenHeight = Utils.getScreenHeight(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(controller: _titleController),
            SizedBox(height: screenHeight * 0.03),
            const ImageInput(),
            SizedBox(height: screenHeight * 0.03),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: addNewPlace,
      child: const Text('+ Add Place'),
    );
  }
}
