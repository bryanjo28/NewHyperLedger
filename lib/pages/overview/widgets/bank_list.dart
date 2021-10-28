import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_apps1/constants/style.dart';
import 'package:flutter_apps1/models/bank_model.dart';
import 'package:flutter_apps1/repository.dart';
import 'package:flutter_apps1/widgets/custom_text.dart';

class BankList extends StatefulWidget {
  const BankList({Key? key}) : super(key: key);

  @override
  State<BankList> createState() => _BankListState();
}

class _BankListState extends State<BankList> {
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
        DataCell(Text("Test")),
      ],
    );
  }
}


// rows: List<DataRow>.generate(
//               7,
//               (index) => DataRow(cells: [
//                 DataCell(CustomText(text: "Santos Enoque")),
//                 DataCell(CustomText(text: "New yourk city")),
//                 DataCell(Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: Colors.deepOrange,
//                       size: 18,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     CustomText(
//                       text: "4.5",
//                     )
//                   ],
//                 )),
//                 DataCell(
//                   Container(
//                     decoration: BoxDecoration(
//                       color: light,
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: active, width: .5),
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     child: CustomText(
//                       text: "Assign Delivery",
//                       color: active.withOpacity(.7),
//                       weight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ]),
//             ),