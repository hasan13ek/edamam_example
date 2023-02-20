import 'package:edamam_example/blocs/food_bloc.dart';
import 'package:edamam_example/blocs/food_event.dart';
import 'package:edamam_example/ui/food_screen/product_screen.dart';
import 'package:edamam_example/widget/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryScreen extends StatefulWidget {
  const QueryScreen({Key? key}) : super(key: key);

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

TextEditingController controller = TextEditingController();
String calories = '';
bool isOn = false;

class _QueryScreenState extends State<QueryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.8),
          title: const Text('Query Screen'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      controller: controller,
                      onChanged: (v) {},
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.search,color: Colors.black,),
                        labelText: 'Oziq Ovqat ',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 278.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1), blurRadius: 8)
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: MyDropDown(
                        onDropSelected: (value) {
                          calories = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: controller.text.isEmpty&&calories.isEmpty?Colors.black.withOpacity(0.2):Colors.black.withOpacity(0.8)),
                  onPressed: () async{
                    if(controller.text.isEmpty&&calories.isEmpty){
                      null;
                    }else {
                      await context.read<FoodBloc>()
                        ..add(
                            GetQueryData(
                                calories: calories, ingr: controller.text)
                        );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ProductScreen()));
                    }
                    },
                  child: const Text('Keyingi'),
                ),
              ),
            ),

          ],
        ));
  }
}
