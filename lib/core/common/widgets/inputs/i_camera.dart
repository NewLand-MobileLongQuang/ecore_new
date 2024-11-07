import 'dart:io';
import 'dart:math';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

String generateRandomString(int length) {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final Random random = Random();
  return String.fromCharCodes(Iterable.generate(
    length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length)),
  ));
}

class ICamera {
  static Future<File> pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    final dir = await getTemporaryDirectory();
    final name = generateRandomString(10);
    final cameraFilePath = '${dir.path}/$name.jpg';

    final result = await FlutterImageCompress.compressAndGetFile(
      returnedImage!.path,
      cameraFilePath,
      quality: 30,
    );

    return File(result!.path);
  }

  static Future<File> pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    final dir = await getTemporaryDirectory();
    final name = generateRandomString(10);
    final galleryFilePath = '${dir.path}/$name.jpg';

    final result = await FlutterImageCompress.compressAndGetFile(
      returnedImage!.path,
      galleryFilePath,
      quality: 30,
    );

    return File(result!.path);
  }
}