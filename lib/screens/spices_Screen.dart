import 'package:flutter/material.dart';
import '../screens/checkout_screen.dart';

class SpicesScreen extends StatelessWidget {
  final List<CartItem> cartItems = [];

  void addToCart(String spiceName, int quantity, double price) {
    print("Added $quantity $spiceName to cart with total price: \$${quantity * price}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " Spices ",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          SpiceCard(
            spiceName: "Cinnamon",
            imagePath: "assets/images/cinnamon.com.png",
            price: 5.99,
            quantity: 10,
            addToCart: addToCart,
          ),
          SpiceCard(
            spiceName: "Dry Chill",
            imagePath: "assets/images/dry chilli.png",
            price: 3.99,
            quantity: 15,
            addToCart: addToCart,
          ),
          SpiceCard(
            spiceName: "Black Pepper",
            imagePath: "assets/images/black pepper.com.png",
            price: 7.99,
            quantity: 8,
            addToCart: addToCart,
          ),
          SpiceCard(
            spiceName: "Turmeric",
            imagePath: "assets/images/turmeric.com.png",
            price: 4.99,
            quantity: 12,
            addToCart: addToCart,
          ),
        ],
      ),
    );
  }
}

class SpiceCard extends StatefulWidget {
  final String spiceName;
  final String imagePath;
  final double price;
  final int quantity;
  final Function(String, int, double) addToCart;

  SpiceCard({
    required this.spiceName,
    required this.imagePath,
    required this.price,
    required this.quantity,
    required this.addToCart,
  });

  @override
  _SpiceCardState createState() => _SpiceCardState();
}

class _SpiceCardState extends State<SpiceCard> {
  int cartQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.imagePath,
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.spiceName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Price: \$${widget.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Quantity: ${widget.quantity} bottles",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (cartQuantity > 0) {
                      widget.addToCart(widget.spiceName, cartQuantity, widget.price);
                      print(
                          "Added ${cartQuantity} ${widget.spiceName} to cart");
                          Navigator.pushNamed(context, '/checkout');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select a quantity."),
                        ),
                      );
                    }
                  },
                  child: Text("Add to Cart"),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (cartQuantity > 0) {
                            cartQuantity--;
                          }
                        });
                      },
                    ),
                    Text(cartQuantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          cartQuantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
