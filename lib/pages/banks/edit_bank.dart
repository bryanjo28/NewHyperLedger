import 'package:flutter/material.dart';
import 'package:flutter_apps1/constants/style.dart';

import '../../repository.dart';

class EditBank extends StatefulWidget {
  const EditBank({
    Key? key,
  }) : super(key: key);

  @override
  _EditBankState createState() => _EditBankState();
}

Repository repository = Repository();
final _beneficiaryController = TextEditingController();
final _debiturController = TextEditingController();
final _keteranganController = TextEditingController();

class _EditBankState extends State<EditBank> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      _beneficiaryController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      _debiturController.text = args[2];
    }
    if (args[3].isNotEmpty) {
      _keteranganController.text = args[3];
    }
    return Scaffold(
      body: (Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
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
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: () async {
                bool response = await repository.putData(
                    int.parse(args[0]),
                    _beneficiaryController.text,
                    _debiturController.text,
                    _keteranganController.text);
                if (response) {
                  Navigator.of(context);
                  print("success");
                } else {
                  Navigator.of(context);
                  print("failed");
                }
              },
              child: Text("Submit"),
            ),
          ),
        ],
      )),
    );
  }
}
