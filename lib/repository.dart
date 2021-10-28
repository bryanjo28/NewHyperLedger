import 'dart:convert';
import 'package:flutter_apps1/models/bank_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://61766b9403178d00173dac04.mockapi.io';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/bank'));
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Bank> buku = it.map((e) => Bank.fromJson(e)).toList();
        return buku;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String beneficiary, String debitur, String keterangan) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/bank'), body: {
        "beneficiary": beneficiary,
        "debitur": debitur,
        "keterangan": keterangan
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(
      int id, String beneficiary, String debitur, String keterangan) async {
    try {
      final response = await http
          .put(Uri.parse(_baseUrl + '/bank/' + id.toString()), body: {
        'beneficiary': beneficiary,
        'debitur': debitur,
        'keterangan': keterangan
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse(_baseUrl + '/bank/' + id));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
