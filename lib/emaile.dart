import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart';

class maile extends StatefulWidget {
  const maile({
    super.key,
  });

  @override
  State<maile> createState() => _maileState();
}

class _maileState extends State<maile> {
  String mail = '';
  String content = '';
  void _sendEmail() async {
    try {
      await EmailJS.send(
        'service_wxfupge',
        'template_yogt473',
        {
          'user_email': '$mail',
          'message': '$content',
        },
        const Options(
          publicKey: 'HfmOIOMIAxRseoINS',
          privateKey: 'kazCPwyBG3OfGQ-VfVmAy',
        ),
      );
      print('SUCCESS!');
    } catch (error) {
      if (error is EmailJSResponseStatus) {
        print('ERROR... ${error.status}: ${error.text}');
      }
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("sel", (route) => false);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 600.0,
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "ادخل البريد الالكتروني"),
                textAlign: TextAlign.center,
                onChanged: (val) {
                  mail = val;
                },
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 600.0,
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "محتوي الرساله"),
                textAlign: TextAlign.center,
                onChanged: (val) {
                  content = val;
                },
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 500.0,
              child: ElevatedButton(
                onPressed: _sendEmail,
                child: const Text('ارسال'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
