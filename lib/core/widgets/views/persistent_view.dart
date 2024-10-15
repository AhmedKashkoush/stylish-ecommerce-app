import 'package:flutter/material.dart';

class PersistentView extends StatefulWidget {
  final Widget child;
  final bool keepAlive;
  const PersistentView({
    super.key,
    required this.child,
    this.keepAlive = true,
  });

  @override
  State<PersistentView> createState() => _PersistentViewState();
}

class _PersistentViewState extends State<PersistentView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
