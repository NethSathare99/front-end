import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';

  final List<CartItem> cartItems; 
  
  CheckoutScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            title: Text(cartItem.itemName),
            subtitle: Text('Quantity: ${cartItem.quantity}, Total: \$${cartItem.totalPrice}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the Payment Screen
                Navigator.pushNamed(context, '/paymentScreen');
              },
              child: Text('Payment'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add logic to delete the cart
              },
              child: Text('Delete Cart'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Home Screen
                Navigator.pushNamed(context, '/homeScreen');
              },
              child: Text('Update Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

  class CartItem {
  final String itemName;
  final int quantity;
  final double totalPrice;

  CartItem({
    required this.itemName,
    required this.quantity,
    required this.totalPrice,
  });
}
