class Bank {
  final String id;
  final String beneficiary;
  final String debitur;
  final String keterangan;

  Bank({
    required this.id,
    required this.beneficiary,
    required this.debitur,
    required this.keterangan,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'],
      beneficiary: json['beneficiary'],
      debitur: json['debitur'],
      keterangan: json['keterangan'],
    );
  }
}
