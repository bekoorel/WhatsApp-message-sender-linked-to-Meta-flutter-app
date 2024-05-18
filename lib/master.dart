import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as x;
import 'package:universal_html/html.dart' show AnchorElement;
import 'color.dart';

import 'uplodedata.dart';

String phone = "";
List conv = [];

Future<List<detamodel>> getphone() async {
  //http://localhost:5050/sendr/getphone.php
  //http://localhost:5050/sendr/getphonetest.php
  //https://animalic-manners.000webhostapp.com/octoper/gitsen.php
  http.Response futurepost =
      await http.get(Uri.parse("http://localhost:5050/sendr/getphone.php"));
  if (futurepost.statusCode == 200) {
    List datapositme = jsonDecode(futurepost.body);
    conv = datapositme;

    List<detamodel> allusrpositme = [];

    for (var u in datapositme) {
      detamodel usarsrollitme = detamodel.fromJson(u);
      allusrpositme.add(usarsrollitme);
    }

    return allusrpositme;
  } else {
    return throw Exception('انقطع الاتصال');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //............................
  List idx = [];
  List namex = [];
  List phonex = [];
  xls() {
    idx.clear();
    namex.clear();
    phonex.clear();
    for (Map k in conv) {
      idx.add(int.parse(k['id']));
      phonex.add(k['phone']);
      namex.add(k['name']);
    }
  }

  //..........
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mycolor.mygren,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("sel", (route) => false);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        backgroundColor: Colors.grey[300],
        body: FutureBuilder<List<detamodel>>(
            future: getphone(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                Future<void> createExcel() async {
                  final x.Workbook workbook = x.Workbook();
                  final x.Worksheet sheet = workbook.worksheets[0];
                  //  sheet.getRangeByName('A1').setText("ddddd");
                  //  sheet.getRangeByName('A2').setText('goooo');
                  sheet.importList(idx, 1, 1, true);
                  sheet.importList(namex, 1, 2, true);
                  sheet.importList(phonex, 1, 3, true);
                  final List<int> bytes = workbook.saveAsStream();
                  workbook.dispose();

                  if (kIsWeb) {
                    AnchorElement(
                        href:
                            'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
                      ..setAttribute('download', 'smart_air_phone.xlsx')
                      ..click();
                  } else {
                    final String path =
                        (await getApplicationSupportDirectory()).path;
                    final String fileName = Platform.isWindows
                        ? '$path\\smart_air_phone.xlsx'
                        : '$path/smart_air_phone.xlsx';
                    final String fileeName =
                        Platform.isWindows ? '$path' : '$path';
                    final File file = File(fileName);
                    await file.writeAsBytes(bytes, flush: true);
                    OpenFile.open(fileName);
                    OpenFile.open(fileeName);
                  }
                }

                return Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    hintText:
                                        "2011xxxxxxxx : ادخل رقم الهاتف كالمثال التالي"),
                                textAlign: TextAlign.center,
                                onChanged: (val) {
                                  phone = val;
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 80.0,
                                  width: 150.0,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                mycolor.mygren),
                                      ),
                                      onPressed: () {
                                        f();
                                      },
                                      child: Text(
                                        "ارسال",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      )),
                                ),
                                Container(
                                  height: 80.0,
                                  width: 150.0,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        roll();
                                      },
                                      child: Text(
                                        "ارسال للكل",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      )),
                                ),
                                Container(
                                  height: 80.0,
                                  width: 150.0,
                                  child: ElevatedButton(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'تصدير \nبيانات العملاء',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                      onPressed: () {
                                        xls();
                                        createExcel();
                                      }),
                                ),
                                Container(
                                  height: 80.0,
                                  width: 150.0,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    bulkUpload())));
                                      },
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "استيراد\nبيانات العملاء",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 100.0,
                            ),
                            Text(
                              "عدد العملاء",
                              style: TextStyle(
                                  color: mycolor.mygren, fontSize: 30),
                            ),
                            Text(
                              "${snapshot.data!.length}",
                              style: TextStyle(
                                  color: mycolor.mygren, fontSize: 70),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                height: 30.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: mycolor.mywhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("${snapshot.data![index].id}"),
                                    Text("${snapshot.data![index].name}"),
                                    Text(
                                      "${snapshot.data![index].phone}",
                                      style: TextStyle(
                                          color: mycolor.mygren,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ))
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }

  roll() {
    for (var k in phonex) {
      phone = k;
      f();
    }
    ;
  }

  f() async {
    var headers = {
      'Authorization':
          'Bearer EAAHYhtaLsQwBAJeqBfO8TUbLXJylsLyLRipIhP3i2NgrVymNi8cRJypugvl9opKk7ONck7zlwRrevP4719crgl1iq6qk4ZCswgCN13NtCTaAzTfegjOIY0g8vcA15gdML2j04sjutMElpZBd2cyQiE8dHZCJUyOzV6EFebQRmR7IKTJtQDZB1JGV2ymyVO2KLQ2XBUPXqQZDZD',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST',
        Uri.parse('https://graph.facebook.com/v15.0/110759165199659/messages'));
    request.body = json.encode({
      "messaging_product": "whatsapp",
      "to": "$phone",
      "type": "template",
      "template": {
        "name": "smart_air",
        "language": {"code": "ar"}
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

class detamodel {
  String? id;
  String? phone;
  String? name;

  detamodel({this.id, this.phone, this.name});

  detamodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['name'] = this.name;

    return data;
  }
}
