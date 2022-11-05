import 'package:vape_monkey2/app/models/api_models/api_get_homedata_model.dart';

import '../../contracts/base_service.dart';

class GetHomeDataService extends BaseService {
  get() async {
    ApiGetHomeDataModel result = ApiGetHomeDataModel.initData();
    try {
      result = await appApiRepo.getHomedata();
      setdata(result);
    } catch (e) {
      print('GetHomeDataService error = $e');
    }
    return result;
  }

  void setdata(ApiGetHomeDataModel resultdata) {
    appModel!.category = resultdata.category!;
    appModel!.categoryBaseUrl = resultdata.categoryBaseUrl!;
    appModel!.coupens != resultdata.coupens!;
    appModel!.couponBaseUrl = resultdata.couponBaseUrl!;
    appModel!.customer = resultdata.customer!;
    appModel!.customerBaseUrl = resultdata.customerBaseUrl!;
    appModel!.offerBanners = resultdata.offerBanners!;
    appModel!.offerBannerBaseUrl = resultdata.offerBannerBaseUrl!;
    appModel!.product = resultdata.product!;
    appModel!.productBaseUrl = resultdata.productBaseUrl!;
    appModel!.promoCodes = resultdata.promoCodes!;
    appModel!.todayPromoExist = resultdata.todayPromoExist!;
  }
}
