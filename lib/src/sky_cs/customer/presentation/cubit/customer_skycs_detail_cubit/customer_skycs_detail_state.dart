part of 'customer_skycs_detail_cubit.dart';

@immutable
sealed class CustomerSkyCSDetailState {}

final class CustomerSkyCSDetailInitial extends CustomerSkyCSDetailState {}

final class CustomerSkyCSDetailLoading extends CustomerSkyCSDetailState {}

final class CustomerSkyCSDetailStateLoaded extends CustomerSkyCSDetailState {
  CustomerSkyCSDetailStateLoaded({
    required this.customerDetail,
    required this.listCall,
    required this.listTicket,
    required this.listCampaign,
    required this.listPhone,
  });

  final SKY_CustomerDetail customerDetail;
  final List<SKY_CustomerCallCall> listCall;
  final List<SKY_CustomerETTicket> listTicket;
  final List<SKY_CustomerCpnCampaignCustomer> listCampaign;
  final List<String> listPhone;
}

final class CustomerSkyCSDetailStateError extends CustomerSkyCSDetailState {
  CustomerSkyCSDetailStateError({required this.message});


  final String message;
}