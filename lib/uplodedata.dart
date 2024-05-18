import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;
import 'package:csv/csv.dart';
import 'color.dart';

ScrollController scrol = ScrollController();

class bulkUpload extends StatefulWidget {
  const bulkUpload({Key? key}) : super(key: key);

  @override
  State<bulkUpload> createState() => _bulkUploadState();
}

class _bulkUploadState extends State<bulkUpload> {
  List<List<dynamic>> _data = [];
  String? filePath;

  // This function is triggered when the  button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: mycolor.mygren,
          title: const Text("صفحه استيراد بيانات من ملف خارجي",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              )),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 500.0,
                        child: Image(image: AssetImage("assets/pic.png")),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        height: 150.0,
                        width: 500.0,
                        decoration: BoxDecoration(
                            color: mycolor.mywhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            textAlign: TextAlign.end,
                            "يجب ان يكون عدد الاعمده اثنان فقد كما في الشكل التالي----\n(csv)يجب ان يكون الملف بصيغه ----"),
                      ),
                      Container(
                        height: 50.0,
                        width: 170.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(mycolor.mygren),
                          ),
                          child: const Text("(csv) اختر ملف بصيغه"),
                          onPressed: () {
                            _pickFile();
                          },
                        ),
                      ),
                      Text(
                        " عدد العملاء الذي تم استيرادهم   ${_data.length.toString()}",
                        style: TextStyle(
                            color: mycolor.myblacl,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Container(
                        height: 50.0,
                        width: 400.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(mycolor.mygren),
                          ),
                          child: const Text(
                              " <  ترحيل الي قاعده البيانات لاستخدامه "),
                          onPressed: () {},
                        ),
                      ),
                    ]),
              ),
            ),
            VerticalDivider(thickness: 10),
            Expanded(
              child: Container(
                child: Scrollbar(
                  controller: scrol,
                  child: ListView.builder(
                    controller: scrol,
                    itemCount: _data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 30.0,
                        margin: EdgeInsets.all(3),
                        color: mycolor.mygren,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _data[index][0].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: mycolor.mywhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              _data[index][1].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: mycolor.mywhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    // print(result.files.first.name);
    filePath = result.files.first.path!;

    final input = File(filePath!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    //  print(fields);

    setState(() {
      _data = fields;
    });
  }
}
