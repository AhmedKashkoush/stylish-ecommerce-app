import 'package:stylish_ecommerce_app/core/dummy/dummy_categories.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_dod.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_sales.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_trending.dart';
import 'package:stylish_ecommerce_app/core/widgets/fields/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/category_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/sales_offer_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _searchResults = [
        ...dummyCategories
            .where((category) => category.name.toLowerCase().contains(query)),
        ...dummyDod
            .where((product) => product.name.toLowerCase().contains(query)),
        ...dummySales.where((sale) => sale.title.toLowerCase().contains(query)),
        ...dummyTrending
            .where((product) => product.name.toLowerCase().contains(query)),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomSearchBar(
          canSearch: true,
          controller: _searchController,
        ),
      ),
      body: _searchResults.isEmpty
          ? const Center(
              child: Text('No results found'),
            )
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final result = _searchResults[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.asset(result.image),
                    title: Text(
                      _getResultTitle(result),
                    ),
                  ),
                );
              },
            ),
    );
  }

  String _getResultTitle(dynamic result) {
    if (result is CategoryModel) {
      return result.name;
    } else if (result is ProductModel) {
      return result.name;
    } else if (result is SalesOfferModel) {
      return result.title;
    } else {
      return 'Unknown Item';
    }
  }
}
