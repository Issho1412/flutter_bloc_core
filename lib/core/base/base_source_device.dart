import 'dart:io';
import 'package:image_picker/image_picker.dart';

class BaseSourceDevice {
  BaseSourceDevice._();

  static Future<File?> getImgFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return File(image!.path);
  }

  static Future<File?> getImgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image?.path != null ? File(image!.path) : null;
  }

  static Future<List<File?>?> getMulImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();
    final List<File?>? result = [];
    if (images?.isNotEmpty != null) {
      for (var element in images!) {
        result?.add(File(element.path));
      }
    }
    return result;
  }

  static Future<File?> getVideoFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    return video?.path != null ? File(video!.path) : null;
  }

  static Future<File?> getVideoFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickImage(source: ImageSource.gallery);
    return video?.path != null ? File(video!.path) : null;
  }
}
