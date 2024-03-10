import 'package:flutter/material.dart';
import '../screens/checkout_screen.dart';

class TeaScreen extends StatelessWidget {
  final List<CartItem> cartItems = [];

  void addToCart(String teaName, int quantity, double price) {
    print("Added $quantity $teaName to cart with total price: \$${quantity * price}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " Tea",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TeaCard(
            teaName: "Green Tea",
            imagePath: "assets/images/green tea.png",
            price: 5.99,
            quantity: 10,
            addToCart: addToCart,
             
          ),
          TeaCard(
            teaName: "Black Tea",
            imagePath: "assets/images/black tea.png",
            price: 3.99,
            quantity: 15,
            addToCart: addToCart,
          
          ),
          TeaCard(
            teaName: "Silver Tea",
            imagePath: "assets/images/silver tea.png",
            price: 10.99,
            quantity: 5,
            addToCart: addToCart,
            
          ),
          TeaCard(
            teaName: "Ginger Tea",
            imagePath: "assets/images/ginger tea.png",
            price: 7.99,
            quantity: 8,
            addToCart: addToCart,
           
          ),
          TeaCard(
            teaName: "Fruite Tea",
            imagePath: "assets/images/fruite tea.png",
            price: 4.99,
            quantity: 12,
            addToCart: addToCart,
            
          ),
        ],
      ),
    );
  }
}



class TeaCard extends StatefulWidget {
  final String teaName;
  final String imagePath;
  final double price;
  final int quantity;
  final Function(String, int, double) addToCart;
   


  TeaCard({
    required this.teaName,
    required this.imagePath,
    required this.price,
    required this.quantity,
    required this.addToCart,
  
  });

  @override
  _TeaCardState createState() => _TeaCardState();
  
  
}

class _TeaCardState extends State<TeaCard> {
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
                  widget.teaName,
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
                  "Quantity: ${widget.quantity} packets",
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
                      widget.addToCart(widget.teaName, cartQuantity, widget.price);
                      print(
                          "Added ${cartQuantity} ${widget.teaName} to cart");
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


