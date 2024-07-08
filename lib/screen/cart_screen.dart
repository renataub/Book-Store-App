import 'package:book_app/main.dart';
import 'package:book_app/model/model.dart';
import 'package:flutter/material.dart';

import 'payment_screen.dart';

class CartPage extends StatefulWidget{
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void _removeFromCart(Book book) {
    setState(() {
      cart.remove(book);
    });
  }

  void _cleanCart(){
    setState(() {
      cart.clear();
    });
  }

  double _calculateTotalPrice(){
    double totalPrice = 0.0;
    for(var book in cart){
      totalPrice += double.tryParse(book.price) ?? 0.0;
    }
    return totalPrice;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        actions: [
          IconButton(
            onPressed: () => _cleanCart(),
            icon: Icon(Icons.delete_forever_rounded, color: Colors.red,),
          ),
        ],
      ),
      body: cart.isEmpty 
      ? Center(child: Text("Your cart is empty"),) 
      : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index){
                  final book = cart[index];
                  return ListTile(
                    leading: Image.asset(book.imageURL),
                    title: Text(book.title),
                    subtitle: Text("\$" + book.price),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: (){
                        _removeFromCart(book);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("Total: \$${ _calculateTotalPrice().toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(onPaymentSuccess: _cleanCart),
                        ),
                      );
                    },
                    child: Text("Pay Now",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }
}