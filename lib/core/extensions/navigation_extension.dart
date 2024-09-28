import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void pop({result}) => Navigator.of(this).pop(result);

  void pushNamed(String name, {Object? arguments}) =>
      Navigator.of(this).pushNamed(name, arguments: arguments);

  void pushNamedAndRemoveUntil(String name, {Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(name, (route) => false,
          arguments: arguments);

  void pushReplacementNamed(String name, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(name, arguments: arguments);

  bool get canPop => Navigator.of(this).canPop();
}

