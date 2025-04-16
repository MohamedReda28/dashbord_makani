import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImageFiled extends StatefulWidget {
  const CustomImageFiled({
    super.key,
    required this.onValueChange,
  });
  final ValueChanged<File?> onValueChange;
  @override
  State<CustomImageFiled> createState() => _CustomImageFiledState();
}

class _CustomImageFiledState extends State<CustomImageFiled> {
  bool isloading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isloading,
      child: GestureDetector(
        onTap: () async {
          isloading = true;
          setState(() {});
          try {
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            fileImage = File(image!.path);
            widget.onValueChange(fileImage!);
          } on Exception catch (e) {}
          isloading = false;
          setState(() {});
        },
        child: Stack(children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.grey)),
            child: fileImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(fileImage!))
                : const Icon(
                    Icons.image_outlined,
                    size: 180,
                  ),
          ),
          Visibility(
            visible: fileImage != null,
            child: IconButton(
                onPressed: () {
                  fileImage = null;
                  widget.onValueChange(fileImage);
                  setState(() {});
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ),
        ]),
      ),
    );
  }
}
