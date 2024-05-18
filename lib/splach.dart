import 'package:bekoorelsender/master.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class sp extends StatefulWidget {
  const sp({super.key});

  @override
  State<sp> createState() => _spState();
}

class _spState extends State<sp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                        child: Lottie.asset('assets/j.json',
                            width: 800.0, height: 800.0))),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Container(
                      height: 800.0,
                      width: 500.0,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Container(
                              height: 200.0,
                              width: 300.0,
                              child:
                                  Image(image: AssetImage('assets/logob.png'))),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                              width: 300.0,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "ادخل اسم المستخدم"),
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                              width: 300.0,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "ادخل كلمه المرور"),
                                textAlign: TextAlign.center,
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "sel", (route) => false);
                            },
                            child: Container(
                                child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Lottie.asset('assets/b.json',
                                    width: 200.0, height: 200.0),
                                Text("دخول"),
                              ],
                            )),
                          )
                        ],
                      )),
                )
              ],
            )));
  }
}
