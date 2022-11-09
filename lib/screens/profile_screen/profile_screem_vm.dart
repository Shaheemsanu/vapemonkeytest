// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:vape_monkey2/app/contracts/base_view_model.dart';
import 'package:vape_monkey2/app/models/api_models/api_profile_update_model.dart';
import 'package:vape_monkey2/app/models/params_model/pm_profile_update.dart';
import 'package:vape_monkey2/app/services/app/profile_update_service.dart';
import 'package:vape_monkey2/utility/common/show_toast.dart';

class ProfileScreenVM extends BaseViewModel {
  String customerName = '';
  String email = '';
  String customerProfile = '';
  String customerBaseUrl = '';

  ProfileScreenVM() {
    customerName = appModel!.customer!.name!;
    email = appModel!.customer!.email!;
    customerProfile = appModel!.customerBaseUrl + appModel!.customer!.image!;
  }

  @override
  void dispose() {}

  Future<void> updateProfile({
    ImageSource? imageSelectOPtion,
    String? password = '',
    String? name,
  }) async {
    String base64Image = await imageToBase64(imageSelectOPtion);

    PmProfileUpdateModel param = PmProfileUpdateModel(
        image: base64Image, password: password, username: customerName);
    ApiProfileUpdateModel result = await ProfileUpdateService().update(param);
    if (result.status! && result.actionStatus!) {
      ShowToast(
              title: '',
              message: 'profile successfully updated',
              parentContext: parentContext!)
          .show();
    } else {
      ShowToast(
              title: '',
              message: 'Faild to upload your profile',
              parentContext: parentContext!)
          .show();
    }
  }

  Future<String> imageToBase64(imageSelectOPtion) async {
    final ImagePicker picker = ImagePicker();
    String base64Code = '';
    if (imageSelectOPtion != null) {
      try {
        XFile? photo = await picker.pickImage(source: imageSelectOPtion);
        Uint8List imageByte = await photo!.readAsBytes();
        base64Code = base64.encode(imageByte);
      } catch (e) {
        print('.....................setProfileImage...................$e....');
      }
    } else {
      /*  ShowToast(
          title: '',
          message: 'Faild to upload your profile Image',
          parentContext: parentContext!); */
    }
    return base64Code;
  }
}
