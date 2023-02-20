abstract class FoodEvent {}

class GetQueryData extends FoodEvent {
  String ingr;
  String calories;
  GetQueryData({
    required this.calories,
    required this.ingr,
  });
}
