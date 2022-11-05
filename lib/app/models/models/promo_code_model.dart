
import 'package:cookee_common/Services/convert_service.dart';

class PromoCodeModel{

       int? id;
       String? name;
       String? description;
       String? promoCode;
       String? url;

      PromoCodeModel({
          this.id,
          this.name,
          this.description,
          this.promoCode,
          this.url,
      });


      factory PromoCodeModel.fromJson(Map<String, dynamic> json) => PromoCodeModel(
          id: ConvertService.convertInt(json["id"]),
          name: ConvertService.convertString(json["name"]),
          description: ConvertService.convertString(json["description"]),
          promoCode: ConvertService.convertString(json["promo_code"]),
          url: ConvertService.convertString(json["url"]),
      );

      Map<String, dynamic> toJson() => {
         "id": id,
         "name": name,
         "description": description,
         "promo_code": promoCode,
         "url": url,
      };

      static List<PromoCodeModel> parseItems(productJson){
      try{
             var list = productJson as List;
             if(list!=null){
                  List<PromoCodeModel> pros = list.map((data)=>PromoCodeModel.fromJson(data)).toList();
                  return pros;
              }
      }
      catch(_){}
         return [];
      }


      static PromoCodeModel? parseItem(Map<String, dynamic> json){
         if(json!=null){
               return PromoCodeModel.fromJson(json);
         }
         return null;
      }


      PromoCodeModel copyItem() => PromoCodeModel(
         id: id,
         name: name,
         description: description,
         promoCode: promoCode,
         url: url,
      );

      List<PromoCodeModel> copyItems(List<PromoCodeModel> items){
         return items.map((e) => e.copyItem()).toList();
       }

      static PromoCodeModel initData() => PromoCodeModel(
         id: 0,
         name: "",
         description: "",
         promoCode: "",
         url: "",
      );
}