import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void pop({result}) => Navigator.of(this).pop(result);

  void pushNamed(String name) => Navigator.of(this).pushNamed(name);

  void pushNamedAndRemoveUntil(String name) =>
      Navigator.of(this).pushNamedAndRemoveUntil(name, (route) => false);

  void pushReplacementNamed(String name) =>
      Navigator.of(this).pushReplacementNamed(name);

  bool get canPop => Navigator.of(this).canPop();
}

