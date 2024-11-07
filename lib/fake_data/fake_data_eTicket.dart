class Eticketmanage {
  Eticketmanage({
    required this.OrgID,
    required this.ColGrpCodeSys,
    required this.ColCodeSys,
    required this.ColOperatorType,
    required this.OrderIdx,
    required this.NameCus,
    required this.Created,
    required this.Status,
    required this.Deadline,
    required this.ColCaption,
    required this.CusAgent,
    required this.RoomAgent,
    required this.Level,
    required this.Desciption,
    required this.File,
    required this.branch,
  });

  final String OrgID;
  final String ColGrpCodeSys;
  final String ColCodeSys;
  final String ColOperatorType;
  final int OrderIdx;
  final String NameCus;
  final String Created;
  final String Status;
  final String Deadline;
  final String ColCaption;
  final String CusAgent;
  final String RoomAgent;
  final String Level;
  final String Desciption;
  final String File;
  final String branch;
}

class EFake{
  static List<Eticketmanage> listeticket = [
    Eticketmanage(
      OrgID: '7206207001',
      ColGrpCodeSys: 'COLGRPCODESYS.2023.01',
      ColCodeSys: 'TK001',
      ColOperatorType: 'Su001',
      OrderIdx: 14,
      NameCus: 'Nguyễn Văn Bình',
      Created: '2023-03-02 09:15',
      Status: 'Open',
      Deadline: '2023-03-02 09:15',
      ColCaption: 'Hỗ trợ tạo đơn hàng trên hệ thông DMS cho khách hàng NGuyễn Văn Bình',
      CusAgent: 'A001',
      RoomAgent: 'SupportCus001',
      Level: 'L001',
      Desciption: '=',
      File: '=',
      branch: 'B001',),
    Eticketmanage(
      OrgID: '7206207001',
      ColGrpCodeSys: 'COLGRPCODESYS.2023.01',
      ColCodeSys: 'TK002',
      ColOperatorType: 'Su001',
      OrderIdx: 14,
      NameCus: 'Trần Hương Ly',
      Created: '2023-03-30 09:15',
      Status: 'Processing',
      Deadline: '2023-03-02 09:15',
      ColCaption: 'Hỗ trợ tạo đơn hàng cho khách hàng',
      CusAgent: 'A001',
      RoomAgent: 'SupportCus001',
      Level: 'L001',
      Desciption: '=',
      File: '=',
      branch: 'B001',),
    Eticketmanage(
      OrgID: '7206207001',
      ColGrpCodeSys: 'COLGRPCODESYS.2023.01',
      ColCodeSys: 'TK003',
      ColOperatorType: 'Su001',
      OrderIdx: 14,
      NameCus: 'Nguyễn Văn An',
      Created: '2023-04-02 09:15',
      Status: 'Solve',
      Deadline: '2023-04-02 09:15',
      ColCaption: 'Họp bàn giao thiết kế mobile',
      CusAgent: 'A001',
      RoomAgent: 'SupportCus001',
      Level: 'L001',
      Desciption: '=',
      File: '=',
      branch: 'B001',),
  ];
}
class PersonContact {
  PersonContact({
    required this.code,
    required this.name,
  });

  final String code;
  final String name;

  static List<PersonContact> listType = [
    PersonContact(code: 'Su001', name: 'Hỗ trợ khách hàng'),
    PersonContact(code: 'Su002', name: 'Bảo hành'),
    PersonContact(code: 'Su003', name: 'Khiếu nại'),
    PersonContact(code: 'Su004', name: 'Khiếu nại nhóm 1'),
  ];
  static List<PersonContact> listroom = [
    PersonContact(code: 'SupportCus001', name: 'Chăm sóc khách hàng'),
    PersonContact(code: 'SupportCus002', name: 'Hỗ trợ khách hàng'),
    PersonContact(code: 'SupportCus003', name: 'Bảo trì'),
  ];
  static List<PersonContact> listlevel = [
    PersonContact(code: 'L001', name: 'Ưu tiên cao'),
    PersonContact(code: 'L002', name: 'Trung bình'),
    PersonContact(code: 'L003', name: 'Ưu tiên thấp'),
  ];
  static List<PersonContact> listAgent = [
    PersonContact(code: 'A001', name: 'Nguyễn Phương A'),
    PersonContact(code: 'A002', name: 'Nguyễn Phương B'),
    PersonContact(code: 'A003', name: 'Nguyễn Phương C'),
    PersonContact(code: 'A004', name: 'Nguyễn Phương D'),
  ];
  static List<PersonContact> listbranch = [
    PersonContact(code: 'B001', name: 'Công ty đầu tư A'),
    PersonContact(code: 'B002', name: 'Công ty đầu tư B'),
    PersonContact(code: 'B003', name: 'Công ty đầu tư C'),
    PersonContact(code: 'B004', name: 'Công ty đầu tư D'),
  ];


}