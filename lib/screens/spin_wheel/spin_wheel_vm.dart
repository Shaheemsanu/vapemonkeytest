import 'dart:math';

import 'package:vape_monkey2/app/contracts/base_view_model.dart';
import 'package:vape_monkey2/app/models/models/promo_code_model.dart';
import 'package:vape_monkey2/screens/spin_wheel/spinwheel_dialog_box.dart';

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
