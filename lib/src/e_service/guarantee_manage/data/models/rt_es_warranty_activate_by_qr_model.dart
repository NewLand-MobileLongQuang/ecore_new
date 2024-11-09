import 'package:ecore/src/e_service/guarantee_manage/domain/entities/rt_es_warranty_activate_by_qr.dart';

class RT_ES_WarrrantyActivateByQRModel extends RT_ES_WarrrantyActivateByQR {
  RT_ES_WarrrantyActivateByQRModel({
    required super.SerialNo,
    required super.ProductCode,
    required super.ProductCodeUser,
    required super.ProductName,
    required super.ProductionDTimeUTC,
    required super.FactoryCode,
    required super.KCS,
    required super.ProductExpiry,
  });

  factory RT_ES_WarrrantyActivateByQRModel.fromMap(Map<String, dynamic> json) {
    return RT_ES_WarrrantyActivateByQRModel(
      SerialNo: json['SerialNo'] as String? ?? '',
      ProductCode: json['ProductCode'] as String? ?? '',
      ProductCodeUser: json['ProductCodeUser'] as String? ?? '',
      ProductName: json['ProductName'] as String? ?? '',
      ProductionDTimeUTC: json['ProductionDTimeUTC'] as String? ?? '',
      FactoryCode: json['FactoryCode'] as String? ?? '',
      KCS: json['KCS'] as String? ?? '',
      ProductExpiry: json['ProductExpiry'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'SerialNo': SerialNo,
      'ProductCode': ProductCode,
      'ProductCodeUser': ProductCodeUser,
      'ProductName': ProductName,
      'ProductionDTimeUTC': ProductionDTimeUTC,
      'FactoryCode': FactoryCode,
      'KCS': KCS,
      'ProductExpiry': ProductExpiry,
    };
  }
}