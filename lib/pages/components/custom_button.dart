import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color? borderColor;
  final double? width;
  final double? veritcalPadding;
  final double? horizontalPadding;
  final double? height;
  final double? borderRadius;
  final Widget child;
  final Function() onTap;

  const CustomButton(
      {Key? key,
      required this.color,
      this.width,
      this.height,
      this.veritcalPadding,
      this.horizontalPadding,
      this.borderRadius,
      this.borderColor,
      required this.child,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: borderColor == null
              ? null
              : Border.all(
                  color: borderColor!,
                  width: 2,
                )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.symmetric(
                vertical: veritcalPadding ?? 18,
                horizontal: horizontalPadding ?? 18),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
