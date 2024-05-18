/*import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class Mysms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePagee(title: 'Twilio_Flutter'),
    );
  }
}

class MyHomePagee extends StatefulWidget {
  MyHomePagee({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageeState createState() => _MyHomePageeState();
}

class _MyHomePageeState extends State<MyHomePagee> {
  late TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC001a904002529bc2982109793f0f0907',
        authToken: '35dca726f66cde401db42fe73684c1ce',
        twilioNumber: '+19498282450');

    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+201118849262',
        messageBody:
            'flutter اهلا بيتر هذه الرساله مرسله بواسطه المبرمج احمد رمضان بمساعده تقنيات ');
  }

  void sendWhatsApp() {
    twilioFlutter.sendWhatsApp(
        toNumber: '+201118849262',
        messageBody:
            'flutter اهلا بيتر هذه الرساله مرسله بواسطه المبرمج احمد رمضان بمساعده تقنيات ');
  }

  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);

    await twilioFlutter.getSMS('***************************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'Click the button to send SMS.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}
*/