class Guarantee {
  Guarantee({
    required this.serial,
    required this.typeProduct,
    required this.informationCustomer,
    required this.installDate,
  });

  final String serial;
  final String typeProduct;
  final String informationCustomer;
  final String installDate;
}

class GuaranteeFakeData {
  static List<Guarantee> listGuarantee = [
    Guarantee(
      serial: '1',
      typeProduct: 'Type Product 1',
      informationCustomer: 'Customer 1',
      installDate: '2022-01-01',
    ),
    Guarantee(
      serial: '2',
      typeProduct: 'Type Product 2',
      informationCustomer: 'Customer 2',
      installDate: '2022-01-01',
    ),
    Guarantee(
      serial: '3',
      typeProduct: 'Type Product 3',
      informationCustomer: 'Customer 3',
      installDate: '2022-01-01',
    ),
    Guarantee(
      serial: '4',
      typeProduct: 'Type Product 4',
      informationCustomer: 'Customer 4',
      installDate: '2022-01-01',
    ),
    Guarantee(
      serial: '5',
      typeProduct: 'Type Product 5',
      informationCustomer: 'Customer 5',
      installDate: '2022-01-01',
    ),
  ];
}