import 'package:stylish_ecommerce_app/features/home/model/product_model.dart';

const String _base = 'assets/images/dummy/dod';

final List<ProductModel> dummyDod = List.generate(
  5,
  (index) {
    return ProductModel(
      id: 'Product $index',
      name: 'Product $index',
      description:
          'Description $index Description $index Description $index Description $index Description $index',
      image: '$_base/shoe.png',
      currency: 'EGP',
      price: 5000,
      rate: 3.5,
      sale: 0.5,
      totalRate: 344567,
    );
  },
);
