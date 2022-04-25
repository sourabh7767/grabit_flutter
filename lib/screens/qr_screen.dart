import 'package:flutter/material.dart';


class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Completed'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.qr_code,),
          )
        ],
      ),
      body: const Center(child: Text('X minutes remaining')),
    );
  }
}
