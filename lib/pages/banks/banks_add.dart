import 'package:flutter/material.dart';
import 'package:flutter_apps1/constants/style.dart';
import 'package:flutter_apps1/routing/routes.dart';
import 'package:get/get.dart';

import '../../repository.dart';

class AddBank extends StatefulWidget {
  const AddBank({Key? key}) : super(key: key);

  @override
  _AddBankState createState() => _AddBankState();
}

Repository repository = Repository();
final _beneficiaryController = TextEditingController();
final _debiturController = TextEditingController();
final _keteranganController = TextEditingController();

class _AddBankState extends State<AddBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Card(
          color: light,
          elevation: 5,
          margin: EdgeInsets.fromLTRB(32, 32, 64, 32),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Column(
                children: [
                  Center(
                    child: Text("Fill Up Form"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: _beneficiaryController,
                        decoration: InputDecoration(hintText: "Beneficiary"),
                      ),
                      TextField(
                        controller: _debiturController,
                        decoration: InputDecoration(hintText: "Debitur"),
                      ),
                      TextField(
                        controller: _keteranganController,
                        decoration: InputDecoration(hintText: "Keterangan"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        bool response = await repository.postData(
                            _beneficiaryController.text,
                            _debiturController.text,
                            _keteranganController.text);
                        if (response) {
                          Navigator.pop(context);
                        } else {
                          AlertDialog(
                            title: Text("Failed"),
                          );
                        }
                      },
                      child: Text("Submit"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
