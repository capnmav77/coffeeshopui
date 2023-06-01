import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  //list of items on sale
  final List _shopItems = [
    //[ itemname, itemprice,caffeine , imagepath , color]
    ["Bubble Tea","4.00","40","images/bubble-tea.png",const Color.fromARGB(255, 215, 240, 124)],
    ["Coffee Cup","3.00","43","images/coffee-cup.png",const Color.fromARGB(255, 249, 206, 142)],
    ["Iced Coffee","3.40","30","images/iced-coffee.png",const Color.fromARGB(255, 188, 232, 244)],
    ["Latte","2.90","40","images/latte.png", const Color.fromARGB(255, 246, 119, 93)],
    ["Iced Coffee","3.40","30","images/iced-coffee.png",const Color.fromARGB(255, 188, 232, 244)],
    ["Latte","2.90","40","images/latte.png", const Color.fromARGB(255, 246, 119, 93)],
    ["Iced Coffee","3.40","30","images/iced-coffee.png",const Color.fromARGB(255, 188, 232, 244)],
    ["Latte","2.90","40","images/latte.png", const Color.fromARGB(255, 246, 119, 93)],
  ];

  //list of cart items 
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add items to the cart
  void addItemToCart(int index)
  {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  //removing items from the cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  //calculating the total price of the cart
  String calculateTotal(){
    double totalprice = 0;
    for(int i=0;i<_cartItems.length;i++){
      totalprice = totalprice + double.parse(cartItems[i][1]);
    }
    return totalprice.toStringAsPrecision(4);
  }
  String calculateTotalcaffeine(){
    double totalcaff = 0;
    for(int i=0;i<_cartItems.length;i++){
      totalcaff = totalcaff + double.parse(cartItems[i][2]);
    }
    return totalcaff.toStringAsPrecision(4);
  }

}