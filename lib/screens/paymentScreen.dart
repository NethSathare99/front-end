import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/paymentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Screen'),
      ),
      body: Center(
        child: Text('This is the Payment Screen'),
      ),
    );
  }
}