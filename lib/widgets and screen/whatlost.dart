import 'package:flutter/material.dart';
import 'package:haya_nomen/widgets%20and%20screen/wholostdetails.dart';
import 'package:haya_nomen/widgets%20and%20screen/whoslider.dart';

class WhatLost extends StatelessWidget {
  const WhatLost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const WhoSlider(),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Wholostdetails(),
                    ),
                  );
                },
                child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/thumb-c.png',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            const Text(
                              'ماذا لو فقدنا الإبهام؟',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              'lib/assets/images/like.png',
                              width: 35,
                              height: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.lightBlueAccent,
                      content: Text(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        "قيد التطوير......",
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 5, 5, 5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/grav.png',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            const Text(
                              'ماذا لو فقدنا الجاذبية؟',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              'lib/assets/images/newton.png',
                              width: 35,
                              height: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () => {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.lightBlueAccent,
                      content: Text(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        "قيد التطوير......",
                        style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 5, 5, 5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                },
                child: Card(
                  color: const Color.fromARGB(255, 254, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/images/eye.png',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            const Text(
                              'ماذا لو فقدنا البصر؟',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              'lib/assets/images/eye-ball.png',
                              width: 35,
                              height: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
