// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../component/config/app_const.dart';
import '../models/product.dart';

part 'products_provider.g.dart';

final List<Product> allProducts = [
  Product(
      id: '1', title: 'Groovy Shorts', price: 12, image: AppConst.imageShorts),
  Product(id: '2', title: 'Karati Kit', price: 34, image: AppConst.imagekarati),
  Product(id: '3', title: 'Denim Jeans', price: 54, image: AppConst.imageJeans),
  Product(
      id: '4', title: 'Red Backpack', price: 14, image: AppConst.imageBackPack),
  Product(
      id: '5', title: 'Drum & Sticks', price: 29, image: AppConst.imageDrum),
  Product(
      id: '6',
      title: 'Blue Suitcase',
      price: 44,
      image: AppConst.imageSuitCase),
  Product(
      id: '7', title: 'Roller Skates', price: 52, image: AppConst.imageSkates),
  Product(
      id: '8',
      title: 'Electric Guitar',
      price: 79,
      image: AppConst.imageGuitar),
];

// final productsProvider = Provider((ref) {
//   return allProducts;
// });

// final reducedProductsProvider = Provider((ref) {
//   return allProducts.where((p) => p.price < 50).toList();
// });

// generated providers
@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> reducedProducts(ref) {
  return allProducts.where((p) => p.price < 50).toList();
}
