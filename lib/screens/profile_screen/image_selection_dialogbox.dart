import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vape_monkey2/Utility/Values/app_colors.dart';
import 'package:vape_monkey2/screens/profile_screen/profile_screem_vm.dart';
import '../../Utility/Values/size_utils.dart';

class ImageSelection {
  static dialogBox({required BuildContext context}) {
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
                          ProfileScreenVM().updateProfile(pContext: context,
                              imageSelectOPtion: ImageSource.gallery);
                          Navigator.pop(context);
                        }),
                    InkWell(
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.grey,
                          size: 50,
                        ),
                        onTap: () {
                          ProfileScreenVM().updateProfile(pContext: context,
                              imageSelectOPtion: ImageSource.camera);
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
