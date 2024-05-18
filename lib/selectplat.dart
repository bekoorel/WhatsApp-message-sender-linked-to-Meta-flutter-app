import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'color.dart';

class sel extends StatefulWidget {
  const sel({super.key});

  @override
  State<sel> createState() => _selState();
}

class _selState extends State<sel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromARGB(-22, 0, 59, 42),
                Color.fromARGB(-22, 0, 70, 42),
                Color.fromARGB(-22, 0, 59, 42),
                Color.fromARGB(-22, 0, 60, 42),
                Color.fromARGB(-22, 0, 59, 42),
                Color.fromARGB(-22, 0, 70, 42),
                Color.fromARGB(-22, 0, 59, 42),
                Color.fromARGB(-22, 0, 70, 42),
                Color.fromARGB(-22, 0, 59, 42),
                Color.fromARGB(-22, 0, 80, 42),
                Color.fromARGB(-22, 0, 59, 42),
                Color.fromARGB(-22, 0, 60, 42),
              ])),
          height: double.infinity,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (() {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("mas", (route) => false);
                }),
                child: Container(
                    height: 500.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Lottie.asset(
                            'assets/wh.json',
                            width: 300.0,
                            height: 300.0,
                          ),
                          Text(
                            "ارسل رسائل واتس اب الي عملائك",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: mycolor.mywhite, fontSize: 20),
                          ),
                        ])),
              ),
              InkWell(
                  onTap: (() {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("mal", (route) => false);
                  }),
                  child: Container(
                      height: 500.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Lottie.asset('assets/em.json',
                              width: 150.0, height: 300.0),
                          Text(
                            "ارسل رسائل بريد الكتروني الي عملائك",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: mycolor.mywhite, fontSize: 20),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
