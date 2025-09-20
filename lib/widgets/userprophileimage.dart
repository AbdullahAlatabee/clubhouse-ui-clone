// import 'dart:ffi';

// import 'package:clubhouse_ui_design/data.dart';
import 'package:flutter/material.dart';

class Userprophileimage extends StatelessWidget {
  final String imageURL;
  final double size;

  const Userprophileimage({
    super.key,
    required this.imageURL,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size/2 - size/10),
      child: Image.network(
        imageURL,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
