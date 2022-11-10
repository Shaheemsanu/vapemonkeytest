import 'package:flutter/material.dart';
import 'package:vape_monkeytest/Utility/Values/app_colors.dart';
import '../../Utility/Values/size_utils.dart';

class ImageSelection {
  static dialogBox(
      {required BuildContext context,
      required Function() onTapGallery,
      required Function() onTapCamera}) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text(
              'Profile Photo',
              textAlign: TextAlign.center,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(10))),
            children: [
              SizedBox(
                width: SizeUtils.getWidth(100),
                height: SizeUtils.getHeight(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        child: const Icon(
                          Icons.image,
                          color: AppColors.grey,
                          size: 50,
                        ),
                        onTap: () {
                          onTapGallery();
                          print('gallery');
                          /*  ProfileScreenVM().updateProfile(
                              pContext: context,
                              imageSelectOPtion: ImageSource.gallery); */
                          Navigator.pop(context);
                        }),
                    InkWell(
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.grey,
                          size: 50,
                        ),
                        onTap: () {
                          onTapCamera();
                          print('camera');
                          /*  ProfileScreenVM().updateProfile(
                              pContext: context,
                              imageSelectOPtion: ImageSource.camera); */
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
