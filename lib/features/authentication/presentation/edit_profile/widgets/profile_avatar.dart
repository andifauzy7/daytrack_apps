import 'dart:io';

import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    super.key,
    required this.avatar,
    required this.onChanged,
  });
  final Uint8List? avatar;
  final Function(Uint8List? value) onChanged;

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  Uint8List? imageFile;

  Future<void> _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path).readAsBytesSync();
      });
    }
    widget.onChanged(imageFile);
  }

  ImageProvider _getImage() {
    if (imageFile != null || widget.avatar != null) {
      return MemoryImage(imageFile ?? widget.avatar!);
    }

    return AssetImage(Assets.images.avatar.path);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: CalculateSize.getWidth(84),
          backgroundImage: _getImage(),
          backgroundColor: Colors.transparent,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              _getFromGallery();
            },
            child: Container(
              width: CalculateSize.getWidth(40),
              height: CalculateSize.getWidth(40),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Icon(
                Icons.edit,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
