import 'package:flutter/material.dart';
import 'package:insuranceapp/Pages/healthInsuForm.dart';

class healthInsuDetails extends StatefulWidget {
  const healthInsuDetails({super.key});

  @override
  State<healthInsuDetails> createState() => _healthInsuDetailsState();
}

class _healthInsuDetailsState extends State<healthInsuDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Insurance Details"),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => healthInsuForm()));
          },
          child: Text("Next")),
    );
  }
}
