import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/discard_button.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';

class UploadedImage extends StatefulWidget {
  const UploadedImage({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<UploadedImage> createState() => _UploadedImageState();
}

class _UploadedImageState extends State<UploadedImage> {
  File? _editedImage;
  bool _loading = false;

  final UserLogic controller = Get.find();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_editedImage == null) _cropImage();
  }

  Future<void> _cropImage() async {
    final croppedImage = await ImageCropper().cropImage(
      compressFormat: ImageCompressFormat.png,
      compressQuality: 5,
      sourcePath: widget.imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '',
          activeControlsWidgetColor: Colors.redAccent,
          toolbarColor: context.background,
          toolbarWidgetColor: primary500,
          backgroundColor: context.background,
          lockAspectRatio: true,
          showCropGrid: false,
          hideBottomControls: false,
          cropStyle: CropStyle.circle,
        ),
      ],
    );

    if (croppedImage != null) {
      setState(() {
        _editedImage = File(croppedImage.path);
      });
    } else {
      Get.back();
    }
  }

  Future<void> _uploadImageToCloudinary() async {
    if (_editedImage == null) return;
    setState(() {
      _loading = true;
    });
    final Uri imageUri = Uri.parse(cloudinaryUrl);

    http.MultipartRequest request = http.MultipartRequest('POST', imageUri);

    http.ByteStream imageStream = http.ByteStream(_editedImage!.openRead());
    int length = await _editedImage!.length();
    http.MultipartFile multipartFile = http.MultipartFile(
      'file',
      imageStream,
      length,
      filename: _editedImage!.path,
    );
    request.files.add(multipartFile);
    request.fields['upload_preset'] = cloudinaryUploadPreset;
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final String responseData = await response.stream.bytesToString();
        final result = json.decode(responseData);

        final isUploaded = await _updateUserAvatar(
          result['secure_url'],
          result['public_id'],
        );

        if (isUploaded) {
          showSuccessSnackBar('Your profile has updated successfully.');
          setState(() {
            _loading = false;
          });
          if (mounted) {
            Navigator.pop(context);
            Navigator.pop(context);
            Get.find<UserLogic>().updateUserData();
          }
        } else {
          showErrorSnackBar('An error has accrued with updating profile.');
          setState(() {
            _loading = false;
          });
          return;
        }
      } else {
        showErrorSnackBar('An error has accrued with updating profile.');
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> _updateUserAvatar(String image, String publicId) async {
    final Uri apiUri =
        Uri.parse('$baseUrl/users/avatar/?image=$image&publicId=$publicId');
    try {
      final http.Response response = await http.patch(
        apiUri,
        headers: prefs.authHeaders,
      );

      if (response.statusCode == 200) {
        await prefs.saveUserDate(response.body);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }

  void _showConfirmDiscardDialog() {
    if (Navigator.of(context).mounted) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text(
              'Discard Changes',
              style: TextStyle(fontSize: 14.sp),
            ),
            message: Text(
              'Are you sure to cancel update profile photo?',
              style: TextStyle(fontSize: 16.sp),
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context); // Close ActionSheet
                  Navigator.pop(context); // Navigate back
                  Navigator.pop(context); // Navigate back
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: primary500),
                ),
              ),
              CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  if (Navigator.of(context).canPop()) Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: primary500),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = controller.user.name.en;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              _showConfirmDiscardDialog();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: context.isDarkMode
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryWhite.withValues(alpha: .1),
                    )
                  : BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff0D0A2C).withValues(alpha: .06),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: primaryWhite,
                    ),
              child: Icon(Icons.arrow_back, size: 19.sp),
            ),
          ),
          title: Text(
            'Preview',
            style: context.textStyle.displaySmall!.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: _editedImage != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color: primary500,
                          ),
                        ),
                        CircleAvatar(
                          radius: 150.r,
                          backgroundColor: primary500,
                          child: Container(
                            width: context.width,
                            height: context.heightByValue(350),
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary500,
                            ),
                            child:
                                Image.file(_editedImage!, fit: BoxFit.contain),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              FButton(
                                title: 'Update Profile',
                                onPressed: () async {
                                  await _uploadImageToCloudinary();
                                },
                              ),
                              addVerticalSpace(context.heightByValue(12)),
                              DiscardButton(
                                onPressed: () {
                                  _showConfirmDiscardDialog();
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : const LoadingIndicator(),
            ),
            if (_loading) const Positioned.fill(child: PageLoading())
          ],
        ),
      ),
    );
  }
}
