import 'package:flutter/material.dart';
import 'package:hotelio/src/config/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
    required this.press,
    required this.width,
  });

  final String name;
  final VoidCallback press;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width == 0 ? double.infinity : width, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: AppColor.primaryC,
        elevation: 30,
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
      ),
    );
  }
}
