import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/widgets/fields/custom_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomSearchBar(
          canSearch: true,
          controller: _searchController,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
