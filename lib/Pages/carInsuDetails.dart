import 'package:flutter/material.dart';
import 'package:insuranceapp/Pages/carInsuForm.dart';

class carInsuDetails extends StatefulWidget {
  const carInsuDetails({super.key});

  @override
  State<carInsuDetails> createState() => _carInsuDetailsState();
}

class _carInsuDetailsState extends State<carInsuDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("car Insurance Details"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => carInsuForm()));
        },
        child: Text("next"),
      ),
    );
  }
}
