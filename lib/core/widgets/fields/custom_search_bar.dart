import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/constants/strings.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';

class CustomSearchBar extends StatefulWidget {
  final bool canSearch, canPop;
  final void Function()? onTap;
  final TextEditingController? controller;
  const CustomSearchBar({
    super.key,
    this.canSearch = false,
    this.onTap,
    this.controller,
    this.canPop = false,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _isEmpty = true;

  @override
  void initState() {
    widget.controller?.addListener(_searchListener);
    super.initState();
  }

  void _searchListener() {
    if (_isEmpty && widget.controller!.text.isNotEmpty) {
      setState(() {
        _isEmpty = false;
      });
    } else if (!_isEmpty && widget.controller!.text.isEmpty) {
      setState(() {
        _isEmpty = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 10,
      color: context.theme.scaffoldBackgroundColor,
      shadowColor: context.theme.iconTheme.color!.withOpacity(0.3),
      borderRadius: BorderRadius.circular(6.0),
      child: TextField(
        onTap: !widget.canSearch ? widget.onTap : null,
        controller: widget.controller,
        readOnly: !widget.canSearch,
        autofocus: true,
        decoration: InputDecoration(
          isDense: true,
          hintStyle: TextStyle(
            color: context.theme.hintColor.withOpacity(0.3),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: widget.canPop
                ? const BackButton()
                : const Icon(
                    Icons.search,
                    size: 24.0,
                  ),
          ),
          prefixIconColor: context.theme.hintColor.withOpacity(0.3),
          suffixIcon: widget.canSearch && !_isEmpty
              ? IconButton(
                  onPressed: _clearText,
                  icon: const Icon(
                    Icons.close,
                    size: 24.0,
                  ),
                )
              : IconButton(
                  onPressed: widget.canSearch ? _micTap : null,
                  icon: const Icon(
                    Icons.mic_none_outlined,
                    size: 24.0,
                  ),
                ),
          suffixIconColor: context.theme.hintColor.withOpacity(0.3),
          hintText: AppStrings.searchHint,
          filled: true,
          fillColor: context.theme.scaffoldBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void _clearText() {
    widget.controller?.clear();
  }

  void _micTap() {}
}
