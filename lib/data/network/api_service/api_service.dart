import 'package:dio/dio.dart';
import 'package:edamam_example/data/model/food_model/food_model.dart';
import 'package:edamam_example/data/model/response/response.dart';
import 'package:edamam_example/data/network/api_client/api_client.dart';


class Apiservic extends ApiClient {
  Future<MyResponse> getQueryData({required String ingr,required String calories}) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl,queryParameters: {
          "app_id":"4c4b9a91",
        "app_key":"c3bf91cc2a4f140f218994a473b83d46",
        'ingr':ingr,
        'nutrition-type':'cooking',
        'calories':calories,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = FoodModel.fromJson(response.data);
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}

