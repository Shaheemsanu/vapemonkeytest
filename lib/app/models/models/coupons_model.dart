
import 'package:cookee_common/Services/convert_service.dart';

class CouponsModel{

       int? id;
       String? name;
       String? promoCode;
       String? description;
       String? expiryDate;
       String? url;
       String? image;
       int? active;
       int? sortOrder;
       String? brandLogo;

      CouponsModel({
          this.id,
          this.name,
          this.promoCode,
          this.description,
          this.expiryDate,
          this.url,
          this.image,
          this.active,
          this.sortOrder,
          this.brandLogo,
      });


      factory CouponsModel.fromJson(Map<String, dynamic> json) => CouponsModel(
          id: ConvertService.convertInt(json["id"]),
          name: ConvertService.convertString(json["name"]),
          promoCode: ConvertService.convertString(json["promo_code"]),
          description: ConvertService.convertString(json["description"]),
          expiryDate: ConvertService.convertString(json["expiry_date"]),
          url: ConvertService.convertString(json["url"]),
          image: ConvertService.convertString(json["image"]),
          active: ConvertService.convertInt(json["active"]),
          sortOrder: ConvertService.convertInt(json["sort_order"]),
          brandLogo: ConvertService.convertString(json["brand_logo"]),
      );

      Map<String, dynamic> toJson() => {
         "id": id,
         "name": name,
         "promo_code": promoCode,
         "description": description,
         "expiry_date": expiryDate,
         "url": url,
         "image": image,
         "active": active,
         "sort_order": sortOrder,
         "brand_logo": brandLogo,
      };

      static List<CouponsModel> parseItems(productJson){
      try{
             var list = productJson as List;
             if(list!=null){
                  List<CouponsModel> pros = list.map((data)=>CouponsModel.fromJson(data)).toList();
                  return pros;
              }
      }
      catch(_){}
         return [];
      }


      static CouponsModel? parseItem(Map<String, dynamic> json){
         if(json!=null){
               return CouponsModel.fromJson(json);
         }
         return null;
      }


      CouponsModel copyItem() => CouponsModel(
         id: id,
         name: name,
         promoCode: promoCode,
         description: description,
         expiryDate: expiryDate,
         url: url,
         image: image,
         active: active,
         sortOrder: sortOrder,
         brandLogo: brandLogo,
      );

      List<CouponsModel> copyItems(List<CouponsModel> items){
         return items.map((e) => e.copyItem()).toList();
       }

      static CouponsModel initData() => CouponsModel(
         id: 0,
         name: "",
         promoCode: "",
         description: "",
         expiryDate: "",
         url: "",
         image: "",
         active: 0,
         sortOrder: 0,
         brandLogo: "",
      );
}