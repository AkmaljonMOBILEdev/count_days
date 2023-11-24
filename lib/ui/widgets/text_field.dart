import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
    required this.hintText,
    this.isLast = false, required this.controller,
  });
  final TextEditingController controller;
  final String hintText;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Enter the ${isLast?'second':'first'} date"),
          const SizedBox(height: 8,),
          TextField(
            keyboardType: TextInputType.datetime,
            textInputAction: isLast?TextInputAction.done:TextInputAction.next,
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black26, width: 1)),
              enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black26, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 1)),
            ),
          ),
        ],
      ),
    );
  }
}
