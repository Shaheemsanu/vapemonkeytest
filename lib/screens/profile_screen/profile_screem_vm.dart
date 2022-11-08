// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vape_monkey2/app/contracts/base_view_model.dart';
import 'package:vape_monkey2/app/models/api_models/api_profile_update_model.dart';
import 'package:vape_monkey2/app/models/params_model/pm_profile_update.dart';
import 'package:vape_monkey2/app/services/app/profile_update_service.dart';
import 'package:vape_monkey2/utility/common/show_toast.dart';

class ProfileScreenVM extends BaseViewModel {
  String customerName = '';
  String customerProfile = '';
  String customerBaseUrl = '';
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  ProfileScreenVM() {
    name.text = appModel!.customer!.name!;
    email.text = appModel!.customer!.email!;
    customerProfile = appModel!.customerBaseUrl + appModel!.customer!.image!;
  }

  @override
  void dispose() {}

  Future<void> updateProfile({
    required BuildContext pContext,
    ImageSource? imageSelectOPtion,
    String? password = '',
  }) async {
    String base64Image = await imageToBase64(imageSelectOPtion);

    print(
        '......................${name.text} \n..............$password \n........................$base64Image');

    PmProfileUpdateModel param = PmProfileUpdateModel(
        image: base64Image, password: password, username: name.text);
    ApiProfileUpdateModel result = await ProfileUpdateService().update(param);
    print(
        '...........................result.status! == ${result.status!}    result.actionStatus! == ${result.actionStatus!} .\n ...${result.message}.');
    if (result.status! && result.actionStatus!) {
      print(
          '.......................profile vm status............${result.customer!.name!}....................');
      ShowToast(
              title: '',
              message: 'profile successfully updated',
              parentContext: pContext)
          .show();
    } else {
      ShowToast(
              title: '',
              message: 'Faild to upload your profile',
              parentContext: pContext)
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
