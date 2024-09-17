import 'package:stylish_ecommerce_app/core/dummy/dummy_dod.dart';
import 'package:stylish_ecommerce_app/core/dummy/dummy_trending.dart';
import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

final List<ProductModel> myDummyWishList = [...dummyTrending, ...dummyDod]
  ..shuffle();
