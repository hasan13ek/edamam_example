import 'package:edamam_example/blocs/food_event.dart';
import 'package:edamam_example/blocs/food_state.dart';
import 'package:edamam_example/data/model/response/response.dart';
import 'package:edamam_example/data/repositories/food_repository/food_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodBloc extends Bloc<FoodEvent,FoodState>{
  FoodBloc({required this.foodRepository}):super(InitialState()){
    on<GetQueryData>(getQueryData);
  }

  final FoodRepository foodRepository;


  getQueryData(GetQueryData  event  , Emitter<FoodState> emit)async{

    emit(LoadInProgress());
    MyResponse myResponse = await foodRepository.gteQueryData(ingr: event.ingr, calories: event.calories);
    if(myResponse.error.isEmpty){
      emit(LoadInSuccess(foods: myResponse.data));
    }else{
      emit(LoadInFailure(error: myResponse.error));
    }
}

}