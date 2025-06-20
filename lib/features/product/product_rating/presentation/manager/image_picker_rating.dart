import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImagePickerRatingController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final Rxn<XFile?> pickedImage = Rxn<XFile?>();

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = pickedFile;
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pickedImage.value = pickedFile;
    }
  }

  Future<String?> uploadImageToCloudinary() async {
    try {
      if (pickedImage.value?.path != null) {
        var request = http.MultipartRequest('POST', Uri.parse(cloudinaryUrl));
        request.fields['upload_preset'] = cloudinaryUploadPreset;
        request.files.add(
          await http.MultipartFile.fromPath('file', pickedImage.value!.path),
        );

        var response = await request.send();
        if (response.statusCode == 200) {
          final responseData =
              json.decode(await response.stream.bytesToString());

          return responseData['secure_url'];
        } else {
          log("Failed to upload image: ${response.reasonPhrase}");
        }
      } else {
        log('No image selected');
      }
    } catch (e) {
      log("Error uploading image: $e");
    }
    return null;
  }
}
