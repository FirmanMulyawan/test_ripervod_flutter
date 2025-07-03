// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../component/config/app_const.dart';
// import '../models/product.dart';

// class CartNotifier extends Notifier<Set<Product>> {
//   // initial value
//   @override
//   Set<Product> build() {
//     return {
//       Product(
//           id: '4',
//           title: 'Red Backpack',
//           price: 14,
//           image: AppConst.imageBackPack),
//     };
//   }

//   // methods to update state
//   void addProduct(Product product) {
//     if (!state.contains(product)) {
//       state = {...state, product};
//     }
//   }

//   void removeProduct(Product product) {
//     if (state.contains(product)) {
//       state = state.where((p) => p.id != product.id).toSet();
//     }
//   }
// }

// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
//   return CartNotifier();
// });

// =======================  generated providers
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';

part 'card_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // initial value
  @override
  Set<Product> build() {
    return {};
  }

  // methods to update state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;
  for (Product product in cartProducts) {
    total += product.price;
  }

  return total;
}
