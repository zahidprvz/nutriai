import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadOptionsWidget extends StatelessWidget {
  final Function(ImageSource) onOptionSelected;

  const UploadOptionsWidget({Key? key, required this.onOptionSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text("Prendre une photo"), // "Take a picture" in French
          onTap: () {
            Navigator.pop(context);
            onOptionSelected(ImageSource.camera);
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text(
              "Choisir dans la gallerie"), // "Choose from gallery" in French
          onTap: () {
            Navigator.pop(context);
            onOptionSelected(ImageSource.gallery);
          },
        ),
      ],
    );
  }
}
