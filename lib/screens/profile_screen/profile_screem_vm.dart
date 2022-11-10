import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:vape_monkeytest/app/contracts/base_view_model.dart';
import 'package:vape_monkeytest/app/models/api_models/api_profile_update_model.dart';
import 'package:vape_monkeytest/app/models/params_model/pm_profile_update.dart';
import 'package:vape_monkeytest/app/services/app/profile_update_service.dart';
import 'package:vape_monkeytest/utility/common/show_toast.dart';
import '../../app/services/app/get_home_data_service.dart';

class ProfileScreenVM extends BaseViewModel {
  String customerName = '';
  String email = '';
  String customerProfile = '';
  String customerBaseUrl = '';
  bool isloading = false;
  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get loaderStream => _loaderController.stream;
  PmProfileUpdateModel param = PmProfileUpdateModel();

  ProfileScreenVM() {
    setdata();
  }
  void setdata() {
    customerName = appModel!.customer!.name!;
    email = appModel!.customer!.email!;
    customerProfile = appModel!.customerBaseUrl + appModel!.customer!.image!;
  }

  @override
  void dispose() {}

  Future<void> refreshScreen() async {
    if (!isloading) {
      isloading = true;
      _loaderSink.add(isloading);
      await GetHomeDataService().get();
      ProfileScreenVM();
      isloading = false;
      _loaderSink.add(isloading);
    }
  }

  Future<void> updateProfileName({
    String? name,
  }) async {
    if (!isloading) {
      isloading = true;
      _loaderSink.add(isloading);
      param =
          PmProfileUpdateModel(username: customerName, image: '', password: '');
      ApiProfileUpdateModel result = await ProfileUpdateService().update(param);
      profileUpdateToast(result);
      isloading = false;
      _loaderSink.add(isloading);
    }
  }

  Future<void> updateProfilePassword({
    String? password = '',
  }) async {
    if (!isloading) {
      isloading = true;
      _loaderSink.add(isloading);
      param = PmProfileUpdateModel(password: password, image: '', username: '');
      ApiProfileUpdateModel result = await ProfileUpdateService().update(param);
      profileUpdateToast(result);
      isloading = false;
      _loaderSink.add(isloading);
    }
  }

  Future<void> updateProfileImage({
    ImageSource? imageSelectOPtion,
  }) async {
    if (!isloading) {
      isloading = true;
      _loaderSink.add(isloading);
      String base64Image = await imageConvertToBase64(imageSelectOPtion);
      param =
          PmProfileUpdateModel(image: base64Image, password: '', username: '');
      ApiProfileUpdateModel result = await ProfileUpdateService().update(param);
      profileUpdateToast(result);
      isloading = false;
      _loaderSink.add(isloading);
    }
  }

  Future<String> imageConvertToBase64(imageSelectOPtion) async {
    final ImagePicker picker = ImagePicker();
    String base64Code = '';
    if (imageSelectOPtion != null) {
      try {
        XFile? photo = await picker.pickImage(source: imageSelectOPtion);
        Uint8List imageByte = await photo!.readAsBytes();
        base64Code = base64.encode(imageByte);
      } catch (e) {
        // print('........................................$e....');
      }
    }
    return base64Code;
  }

  profileUpdateToast(ApiProfileUpdateModel result) {
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
}
