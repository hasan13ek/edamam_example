import 'package:edamam_example/data/model/response/response.dart';
import 'package:edamam_example/data/network/api_service/api_service.dart';

class FoodRepository {
  FoodRepository({required this.apiservic});
  final Apiservic apiservic;
  Future<MyResponse> gteQueryData(
          {required String ingr, required String calories}) =>
      apiservic.getQueryData(
        ingr: ingr,
        calories: calories,
      );
}
