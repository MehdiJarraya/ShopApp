import 'package:flutter/material.dart';

import './product.dart';
// MIXING (with) VS Inheretence (extend)
//  with => mixing simply merge some property adn mthd in the new classe BUT
// we dont return the new class as an instance of the inhretence class
// when using inhretence extend => the new class will be instance of two classes the inhrertence + the new classe
//That's mean we can instaciate with it the inheretence class by passing inheretence classes arguement
// another difference is we can only extend ONE 1 classes but we can mixing many classes
// with => to use mixin it is a light   inheretence :p

// ChangeNotifier is widget to establish behind the scenes communications with the help of context object
// that is available in every widget
class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    // toList() return new list automaticly so we don't have to do ma,ual coppying  like [...items]
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }

    // return a copy of items using [...]
    // then in add mehtod will notify all the widget listner to rebuild and then take a new copy ;)
    // Why a copy ? => if we were return the real _items and updating the real _items in other widget how can we notify
    //   the changes => we could only use notifyListeners in the provider widget
    return [..._items];
  }

  List<Product> get favoriteItems {
    // toList() return new list automaticly so we don't have to do manual coppying
    //like   List<Product> get items {return [...items]}
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

// if we where doing filter using var _showFavoritesOnly here +  showAll() and _showFavoritesOnly
// ----when we navigate to other screen we will have filtred items not all the product
// so It's recommanded to implement filters and same logic in local state not with provider

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    // will notify all the widget listner to rebuild and then take a new copy ;)
    notifyListeners();
  }
}
