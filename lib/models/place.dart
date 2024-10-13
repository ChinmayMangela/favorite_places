

import 'dart:io';

class Place {
  final String name;
  final File image;

  const Place({
    required this.name,
    required this.image,
  });

  factory Place.fromJson(Map<String, dynamic> data) {
    return Place(
      name: data['name'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
