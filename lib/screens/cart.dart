import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../widgets/card/cart_card.dart';
import 'appbar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          title: AppName(),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2 / 3, mainAxisSpacing: 15, crossAxisSpacing: 15),
          itemCount: cart.items.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int i) {
            return CartCardTile(
              id: cart.items.values.toList()[i].id!,
              productId: cart.items.keys.toList()[i],
              price: cart.items.values.toList()[i].price!,
              quantity: cart.items.values.toList()[i].quantity!,
              name: cart.items.values.toList()[i].name!,
              category: cart.items.values.toList()[i].category!,
              image: cart.items.values.toList()[i].image!,
            );
          },
        ),
      ),
    );
  }
}