

import 'dart:io';

import 'package:http/http.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/web_supporting_http_client.dart';

import '../configs/app_config.dart';
import 'local_notification_service.dart';



class HttpOverrideCertificateVerificationInDev extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class SignalRService
{
  HubConnection? _hubConnection;
  late bool connectionIsOpen;


  void _httpClientCreateCallback(Client httpClient) {
    HttpOverrides.global = HttpOverrideCertificateVerificationInDev();
  }


  Future<void> openHubConnection() async {

    if (_hubConnection == null) {

      String url='https://${AppConfig.current().realtimeServiceBaseUrl}/hub/global/?networkId=4053894000&orgId=4053894000&userId=3276623000&userEmail=tuyenba@idocnet.com';
      final httpConnectionOptions = new HttpConnectionOptions(
          httpClient: WebSupportingHttpClient(null,
              httpClientCreateCallback: _httpClientCreateCallback),
        accessTokenFactory: () async =>
        await getAccessToken()

          );

      _hubConnection = HubConnectionBuilder()
          .withUrl(url, options: httpConnectionOptions)
          .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000])
          //.configureLogging(logger)
          .build();
      _hubConnection!.onclose(({error}) => connectionIsOpen = false);
      _hubConnection!.onreconnecting(({error}) {
        print("onreconnecting called");
        connectionIsOpen = false;
      });
      _hubConnection!.onreconnected(({connectionId}) {
        print("onreconnected called");

        connectionIsOpen = true;

        LocalNotificationService().newNotification(
            message: 'Ecore background', detail: 'Hub connected');
      });
      _hubConnection!.on("ReceiveMessage", _handleIncommingChatMessage);
    }

    if (_hubConnection!.state != HubConnectionState.Connected) {
      await _hubConnection!.start();
      connectionIsOpen = true;
    }
  }


  void _handleIncommingChatMessage(List<Object?>? args) {
   if(args!=null && args.length>0)
     {
       var map= args[0] as Map<String, dynamic>;
       String? name= map["eventName"];
       String? detail=map["eventDetail"];
       print(name);
       print(detail);
       // LocalNotificationService().newNotification(
       //     message: 'Ecore background', detail: name??"");
     }

  }

  String getAccessToken() {return "";}


}