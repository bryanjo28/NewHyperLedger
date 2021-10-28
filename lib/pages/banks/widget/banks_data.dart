import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps1/constants/style.dart';
import 'package:flutter_apps1/models/bank_model.dart';
import 'package:flutter_apps1/pages/banks/edit_bank.dart';
import 'package:flutter_apps1/widgets/custom_text.dart';

import '../../../repository.dart';

class BanksData extends StatefulWidget {
  const BanksData({Key? key}) : super(key: key);

  @override
  _BanksDataState createState() => _BanksDataState();
}

class _BanksDataState extends State<BanksData> {
  List<Bank> listBank = [];
  Repository repository = Repository();

  getData() async {
    listBank = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: "Bank List",
                color: lightGrey,
                weight: FontWeight.bold,
              ),
            ],
          ),
          DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: [
              DataColumn2(
                label: Text("Beneficiary"),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Text("Debitur"),
              ),
              DataColumn(
                label: Text("Keterangan"),
              ),
              DataColumn(
                label: Text('Operation'),
              ),
            ],
            rows: List.generate(
              listBank.length,
              (index) => recentBankRow(listBank[index], context),
            ),
          ),
        ],
      ),
    );
  }

  DataRow recentBankRow(Bank bank, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(Text(bank.beneficiary)),
        DataCell(Text(bank.debitur)),
        DataCell(Text(bank.keterangan)),
        DataCell(
          Row(
            children: [
              ElevatedButton(
                child: Icon(Icons.edit),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () => Navigator.of(context)
                    .popAndPushNamed('/edit_bank', arguments: [
                  bank.id,
                  bank.beneficiary,
                  bank.debitur,
                  bank.keterangan
                ]),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                child: Icon(Icons.delete),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () async {
                  bool response = await repository.deleteData(bank.id);
                  if (response) {
                    print('Delete data success');
                  } else {
                    print('Delete data failed');
                  }
                  getData();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
