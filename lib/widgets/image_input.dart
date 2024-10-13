import 'dart:io';

import 'package:favorite_places/providers/selected_image_provider.dart';
import 'package:favorite_places/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final _imagePicker = ImagePicker();

  void _onSelectImageTapped() {
    Utils.displayDialog(
      context,
      _selectImagesDialog(),
    );
  }

  Future<void> _pickImage(ImageSource imageSource) async {
    final imageProvider =
        Provider.of<SelectedImageProvider>(context, listen: false);
    try {
      final pickedImage = await _imagePicker.pickImage(source: imageSource);
      if (pickedImage != null) {
        imageProvider.selectImage(File(pickedImage.path));
        setState(() {
        });
        Navigator.of(context).pop();
      }
    } catch (error) {
      final errorMessage = imageSource == ImageSource.camera
          ? 'Unable to capture picture'
          : 'Unable to get image';
      Utils.showSnackBar(errorMessage);
      print(error.toString());
    }
  }

  Future<void> _captureImage() async {
    await _pickImage(ImageSource.camera);
  }

  Future<void> _selectImageFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider =
        Provider.of<SelectedImageProvider>(context, listen: false);
    Widget content = imageProvider.selectedImage == null
        ? TextButton(
            onPressed: _onSelectImageTapped,
            child: const Text('Select Picture'),
          )
        : Image.file(
            imageProvider.selectedImage!,
            fit: BoxFit.cover,
          );

    return Container(
      width: Utils.getScreenWidth(context),
      height: Utils.getScreenHeight(context) * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: content,
    );
  }

  Widget _selectImagesDialog() {
    final color = Theme.of(context).colorScheme.onSecondary;
    final textStyle = TextStyle(color: color);
    return Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: _captureImage,
            leading: Icon(
              Icons.camera_alt,
              color: color,
            ),
            title: Text('Capture Image', style: textStyle),
          ),
          ListTile(
            onTap: _selectImageFromGallery,
            leading: Icon(
              Icons.attach_file_sharp,
              color: color,
            ),
            title: Text(
              'Select From Gallery',
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
