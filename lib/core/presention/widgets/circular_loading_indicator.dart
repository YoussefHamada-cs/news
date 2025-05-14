import 'package:flutter/material.dart';
import 'package:news/core/resources/app_colors.dart';

class CircularLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const CircularLoadingIndicator({
    super.key,
    this.size = 40.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color ?? AppColors.primary,
          strokeWidth: 3.0,
        ),
      ),
    );
  }
}
