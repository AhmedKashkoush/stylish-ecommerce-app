import 'package:flutter/material.dart';

extension SpaceExtension on num {
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
}


