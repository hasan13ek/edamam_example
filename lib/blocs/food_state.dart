import 'package:edamam_example/data/model/food_model/food_model.dart';

abstract class FoodState {}

class InitialState extends FoodState {}

class LoadInProgress extends FoodState {}

class LoadInSuccess extends FoodState {
  final FoodModel foods;
  LoadInSuccess({
    required this.foods,
  });
}

class LoadInFailure extends FoodState {
  String error;
  LoadInFailure({
    required this.error,
  });
}
