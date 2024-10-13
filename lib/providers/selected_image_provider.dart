import 'dart:io';
import 'package:flutter/material.dart';

class SelectedImageProvider extends ChangeNotifier {

  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  void selectImage(File? newImage) {
    _selectedImage = newImage;
    notifyListeners();
  }
}