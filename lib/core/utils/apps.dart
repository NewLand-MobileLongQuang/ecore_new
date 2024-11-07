

import '../res/media_res.dart';

class Apps {
  Apps({required this.image, required this.title});

  final String image;
  final String title;

  static List<Apps> listApps = [
    Apps(image: AppMediaRes.iconEService, title: 'E-Service'),
    Apps(image: AppMediaRes.iconSkyCS, title: 'SkyCS'),
    Apps(image: AppMediaRes.iconDMS, title: 'E-Search'),
    Apps(image: AppMediaRes.iconDMS, title: 'E-Mapping'),
  ];
}

class AppEService {
  AppEService({required this.image, required this.title});

  final String image;
  final String title;

  static List<AppEService> listSolutionEService = [
    AppEService(image: AppMediaRes.iconManage, title: 'Quản lí bảo hành'),
    AppEService(image: AppMediaRes.iconManage, title: 'Quản lí sửa chữa'),
  ];
}

class AppSkyCs {
  AppSkyCs({required this.image, required this.title});

  final String image;
  final String title;

  static List<AppSkyCs> listSolutionSkyCs = [
    AppSkyCs(image: AppMediaRes.iconCall1, title: 'Gọi điện'),
    AppSkyCs(image: AppMediaRes.iconManage, title: 'Giám sát'),
    AppSkyCs(image: AppMediaRes.iconTicket01, title: 'eTicket'),
    AppSkyCs(image: AppMediaRes.iconCampaign, title: 'Chiến dịch'),
    AppSkyCs(image: AppMediaRes.iconPersonGroup01, title: 'Khách hàng'),
    AppSkyCs(image: AppMediaRes.iconReport, title: 'Báo cáo'),
  ];
}