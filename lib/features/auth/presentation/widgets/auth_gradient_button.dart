import 'package:bloacktut/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
class AuthGradientButton extends StatelessWidget {
  final String ButtonText;
  final VoidCallback onPressed;
  const AuthGradientButton({Key? key,required this.ButtonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          AppPallete.gradient1,
          AppPallete.gradient2,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          fixedSize: Size(395,55),
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor
        ),
        child: Text(ButtonText,style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17
        ),),

      ),
    );
  }
}
