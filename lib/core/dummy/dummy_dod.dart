import 'package:stylish_ecommerce_app/features/products/home/model/product_model.dart';

const String _base = 'assets/images/dummy/dod';

final List<ProductModel> dummyDod = List.generate(
  5,
  (index) {
    return index % 2 == 0
        ? ProductModel(
            id: 'Product $index',
            name: 'Product $index',
            description:
                'Description $index Description $index Description $index Description $index Description $index',
            image: '$_base/shoe.png',
            currency: 'EGP',
            category: 'men',
            price: 8000,
            rate: 5,
            totalRate: 344567,
          )
        : ProductModel(
            id: 'Product $index',
            name: 'Product $index',
            description:
                'Description $index Description $index Description $index Description $index Description $index',
            image: '$_base/shoe.png',
            currency: 'EGP',
            category: 'women',
            price: 5000,
            rate: 3.5,
            sale: 0.5,
            totalRate: 344567,
          );
  },
);
