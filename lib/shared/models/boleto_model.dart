import 'dart:convert';

class BoletoModel {
  final String? nome;
  final String? dueDate;
  final double? value;
  final String? barcode;

  BoletoModel({
    this.nome,
    this.dueDate,
    this.value,
    this.barcode,
  });

  BoletoModel copyWith({
    String? nome,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    return BoletoModel(
      nome: nome ?? this.nome,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      nome: map['nome'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) =>
      BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(nome: $nome, dueDate: $dueDate, value: $value, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoletoModel &&
        other.nome == nome &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return nome.hashCode ^ dueDate.hashCode ^ value.hashCode ^ barcode.hashCode;
  }
}
