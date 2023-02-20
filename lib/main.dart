import 'package:edamam_example/blocs/food_bloc.dart';
import 'package:edamam_example/data/network/api_service/api_service.dart';
import 'package:edamam_example/data/repositories/food_repository/food_repository.dart';
import 'package:edamam_example/ui/food_screen/query_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FoodRepository(
            apiservic: Apiservic(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FoodBloc(
              foodRepository: context.read<FoodRepository>(),
            ),
          ),
        ],
        child:  MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QueryScreen(),
    );
  }
}
