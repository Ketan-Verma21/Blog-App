import 'package:flutter/material.dart';
class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObs ;
  const AuthField({Key? key,required this.hintText,required this.controller,this.isObs=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObs,
      obscuringCharacter: '*',
      controller: controller,
      decoration: InputDecoration(
        hintText:hintText
      ),
      validator: (value){
        if(value!.isEmpty){
          return "$hintText is missing";
        }
        return null;
      },
    );
  }
}
