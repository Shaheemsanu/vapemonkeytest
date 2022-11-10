import 'dart:math';

import 'package:vape_monkeytest/app/contracts/base_view_model.dart';
import 'package:vape_monkeytest/app/models/models/promo_code_model.dart';
import 'package:vape_monkeytest/screens/spin_wheel/spinwheel_dialog_box.dart';

class SpinWheelScreenVm extends BaseViewModel {
  void getCoupon(int selectedNo) {
    List<PromoCodeModel>? promoCodeDatas = appModel!.promoCodes;
    int randomNo = Random().nextInt(10);
    if (promoCodeDatas.length > randomNo) {
      ShowDialogBox.dialogBox(
          context: parentContext!,
          isWin: true,
          promoCode: promoCodeDatas[randomNo]);
    } else {
      ShowDialogBox.dialogBox(context: parentContext!, isWin: false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
