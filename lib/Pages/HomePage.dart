import 'package:flutter/material.dart';
import 'package:insuranceapp/Pages/carInsuDetails.dart';
import 'package:insuranceapp/Pages/completeProfile.dart';
import 'package:insuranceapp/Pages/healthInsuDetails.dart';
import 'package:insuranceapp/Pages/healthInsuForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Dashboard",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 4,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 8.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => healthInsuDetails()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              "assets/images/insurancelogo.png",
                              width: 90,
                              height: 90,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Health Insurance")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => carInsuDetails()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/insurancelogo.png",
                            width: 90,
                            height: 90,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Car Insurance")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Ambulance")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Towing Service")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => completeProfile()));
                        },
                        child: Text("Complete Profile")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Query")),
                  ),
                ]),
          ),
        ));
  }
}
