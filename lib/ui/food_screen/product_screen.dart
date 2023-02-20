import 'package:cached_network_image/cached_network_image.dart';
import 'package:edamam_example/blocs/food_bloc.dart';
import 'package:edamam_example/blocs/food_state.dart';
import 'package:edamam_example/data/model/food_model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        title: const Text('Product Screen'),
      ),
      body: BlocBuilder<FoodBloc,FoodState>(builder: (context,state){
        if(state is LoadInProgress){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state is LoadInFailure){
          return Center(child: Text(state.error,style:const TextStyle(color: Colors.red,fontSize: 24),),);
        }else if(state is LoadInSuccess){
          return SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(state.foods.hints.length, (index) {
                  return SizedBox(
                    height: 100,
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      margin: EdgeInsets.all(12),
                      child: ListTile(
                        title: Text(state.foods.hints[index].food.label),
                        leading: Text('${index+1}'),
                        trailing:
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              image: NetworkImage(
                                state.foods.hints[index].food.image.toString(),
                              ),
                            ),
                          ),
                        ),

                      ),
                    ),
                  );
                })
              ],
            ),
          );
        }
        return const Center(child: Text('Oxirgi Return'),);
      })
    );
  }
}
