import 'package:edamam_example/widget/kind_list.dart';
import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key, required this.onDropSelected}) : super(key: key);

  final ValueChanged<String> onDropSelected;

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String dropdownValue = kindList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
        widget.onDropSelected.call(dropdownValue);
      },
      items: kindList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black.withOpacity(0.8),
              ),
              child: Text(value,style: const TextStyle(color: Colors.white,fontSize: 16),)),
        );
      }).toList(),
    );
  }
}