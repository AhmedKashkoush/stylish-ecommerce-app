import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:stylish_ecommerce_app/features/products/all_products/view/widgets/tab_view.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/category_model.dart';

class AllProductsScreen extends StatefulWidget {
  final List<CategoryModel> categories;
  final String initialTab;
  const AllProductsScreen({
    super.key,
    required this.categories,
    this.initialTab = 'Deal Of The Day',
  });

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen>
    with SingleTickerProviderStateMixin {
  late final List<String> _tabs;
  late final TabController _tabController;

  @override
  void initState() {
    _tabs = [
      'Deal Of The Day',
      'Trending',
      ...widget.categories.map((e) => e.name).toList(),
    ];
    _tabController = TabController(
      initialIndex: _tabs.indexOf(widget.initialTab),
      length: _tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
          isScrollable: true,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          controller: _tabController,
        ),
      ),
      backgroundColor: context.theme.colorScheme.surface,
      body: TabBarView(
        controller: _tabController,
        children: _tabs
            .map(
              (category) => TabView(
                category: category,
              ),
            )
            .toList(),
      ),
    );
  }
}
