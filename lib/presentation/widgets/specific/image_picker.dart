import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(String imageUrl) onImagePicked;

  const ImagePickerWidget({Key? key, required this.onImagePicked}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _pickedImage;
  bool _isUploading = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    setState(() {
      _pickedImage = File(pickedFile.path);
    });

    await _uploadImage(File(pickedFile.path));
  }

  Future<void> _uploadImage(File imageFile) async {
    setState(() => _isUploading = true);

    try {
      final fileName = path.basename(imageFile.path);
      final uniqueId = const Uuid().v4();
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('inventory_images/$uniqueId-$fileName');

      final uploadTask = await storageRef.putFile(imageFile);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      widget.onImagePicked(downloadUrl);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image upload failed: $e')),
      );
    }

    setState(() => _isUploading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_pickedImage != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              _pickedImage!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        if (_pickedImage == null)
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.grey[200],
            child: const Icon(Icons.image, size: 60, color: Colors.grey),
          ),
        const SizedBox(height: 10),
        _isUploading
            ? const CircularProgressIndicator()
            : ElevatedButton.icon(
                icon: const Icon(Icons.upload),
                label: const Text('Pick & Upload Image'),
                onPressed: _pickImage,
              ),
      ],
    );
  }
}

