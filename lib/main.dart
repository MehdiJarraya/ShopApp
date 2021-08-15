import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          // we can use  ChangeNotifierProvider.value( value: Products() =>  if Products() d'ont depend on context
          //  ChangeNotifierProvider(builder : (ctx)=> Product() => if Products() depend on context
          // the second way using builder way can cause bugs with item beyond the screen when recycling widget :( provider can't keep up with changes

          // Note that
          // When creating new instance provide it's recommanded to use => ChangeNotifierProvider( create : Products() )
          // when using existing object like in product_gridpage use => ChangeNotifierProvider.value(value: products[i],
          //  ChangeNotifierProvider.value(value: products[i], clean previous data when exiting the page ;)
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
          }),
    );
  }
}
