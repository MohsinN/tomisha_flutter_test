import 'package:flutter/material.dart';
import 'package:web_test/ui/helpers/colors.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final TextStyle? titleStyle;
  final Function() onPressed;

  const CustomButton(
      {Key? key,
      this.width = double.infinity,
      required this.title,
      required this.onPressed,
      this.height = 50,
      this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 8),
        width: width,
        height: height,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            gradient:const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            CustomColors.blueGradient,
            CustomColors.greenGradient,
          ],
        )),
        child: Text(title,textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontSize: 10),),
      ),
    );
  }
}
