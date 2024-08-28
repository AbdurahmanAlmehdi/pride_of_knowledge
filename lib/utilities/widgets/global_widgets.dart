import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final double? height;
  final Widget? child;
  const Tile({super.key, this.height = 120, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2.5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: child,
        ),
      ),
    );
  }
}
