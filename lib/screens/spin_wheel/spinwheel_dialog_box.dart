import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vape_monkey2/Utility/Components/footer_button.dart';
import 'package:vape_monkey2/Utility/Values/app_colors.dart';
import 'package:vape_monkey2/Utility/Values/font_utils.dart';
import 'package:vape_monkey2/Utility/Values/size_utils.dart';
import 'package:vape_monkey2/Utility/Values/utils.dart';
import 'package:vape_monkey2/app/models/models/promo_code_model.dart';
import '../web_view/web_view.dart';

class ShowDialogBox {
  static dialogBox(
      {required BuildContext context,
      required bool isWin,
      PromoCodeModel? promoCode}) {
    return showDialog(
        barrierColor: Colors.black.withOpacity(0.8),
        context: context,
        builder: (context) {
          return Stack(
            children: [
              SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(25))),
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeUtils.getHeight(25),
                        bottom: SizeUtils.getHeight(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isWin ? 'Congratulations' : 'Oh ho! Try Again',
                          style: FontUtils.getfont24Style(
                              color: isWin
                                  ? AppColors.fortuneButtonColor
                                  : AppColors.black),
                        ),
                        isWin
                            ? Image.asset(Utils.getAssetPng('emoji'))
                            : const Text(''),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.getWidth(32),
                        vertical: SizeUtils.getHeight(7)),
                    child: Center(
                      child: Text(
                        isWin
                            ? promoCode!.description!
                            : 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia con.',
                      ),
                    ),
                  ),
                  isWin
                      ? Center(
                          child: InkWell(
                            child: Container(
                              width: SizeUtils.getWidth(120),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      Utils.getAssetPng('coupenborder')),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.all(SizeUtils.getHeight(12)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          Utils.getAssetSvg('akaricon')),
                                      Text(promoCode!.promoCode!),
                                      SvgPicture.asset(
                                          Utils.getAssetSvg('iconscopy'))
                                    ]),
                              ),
                            ),
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: promoCode.promoCode!));
                            },
                          ),
                        )
                      : const Text(''),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.getHeight(12),
                    ),
                    child: FooterButton(
                      label: isWin ? 'Gift Now' : 'Spin Again',
                      buttonColor: AppColors.grey,
                      onPressed: () {
                        isWin
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WebViewScreen()))
                            : Navigator.pop(context);
                      },
                    ),
                  ),
                  isWin
                      ? TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Spin Again',
                            style: FontUtils.getfont18Style(
                                color: AppColors.primaryColor),
                          ))
                      : const Text('')
                ],
              ),
            ],
          );
        });
  }
}
