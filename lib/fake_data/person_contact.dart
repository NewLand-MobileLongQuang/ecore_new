class PersonContact {
  PersonContact({
    required this.name,
    required this.phone,
  });

  final String name;
  final String phone;

  static List<PersonContact> listContact = [
    PersonContact(name: 'Lê Văn A', phone: '0901234567'),
    PersonContact(name: 'Nguyễn Văn B', phone: '0912345678'),
    PersonContact(name: 'Trần Văn C', phone: '0923456789'),
    PersonContact(name: 'Phạm Văn D', phone: '0934567890'),
    PersonContact(name: 'Hoàng Văn E', phone: '0945678901'),
    PersonContact(name: 'Nguyễn Văn F', phone: '0956789012'),
    PersonContact(name: 'Trần Văn G', phone: '0967890123'),
    PersonContact(name: 'Phạm Văn H', phone: '0978901234'),
    PersonContact(name: 'Hoàng Văn I', phone: '0990123456'),
  ];

  static List<String> listPhone = <String>[
    '1900100',
    '1900101',
    '1900102',
    '1900103',
    '1900104',
  ];
  static List<String> listBranch = <String>[
    'Chi nhánh Miền Bắc',
    'Chi nhánh Miền Trung',
    'Chi nhánh Miền Nam',
  ];

}