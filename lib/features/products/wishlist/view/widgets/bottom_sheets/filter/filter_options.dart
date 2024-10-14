import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

class FilterOptions {
  final List<String> filters, categories;
  final List<ProductModel> filteredItems;
  final RangeValues? price, ratings;

  const FilterOptions({
    required this.filters,
    this.categories = const [],
    this.filteredItems = const [],
    this.price,
    this.ratings,
  });

  FilterOptions copyWith({
    List<String>? filters,
    List<String>? categories,
    List<ProductModel>? filteredItems,
    RangeValues? price,
    RangeValues? ratings,
  }) {
    return FilterOptions(
      filters: filters ?? this.filters,
      categories: categories ?? this.categories,
      filteredItems: filteredItems ?? this.filteredItems,
      price: price ?? this.price,
      ratings: ratings ?? this.ratings,
    );
  }

  @override
  String toString() {
    return 'FilterOptions(filters: $filters, categories: $categories, filteredItems: $filteredItems, price: $price, ratings: $ratings)';
  }
}
