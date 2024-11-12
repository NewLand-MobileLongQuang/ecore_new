part of 'customer_skycs_create_cubit.dart';

@immutable
sealed class CustomerSkyCSCreateState {}

final class CustomerSkyCSCreateStateInitial extends CustomerSkyCSCreateState {}

final class CustomerSkyCSCreateLoading extends CustomerSkyCSCreateState {}

class CustomerSkyCSCreateLoaded extends CustomerSkyCSCreateState {
final List<SKY_CustomerGroupModel> listGroupFold;
final List<SKY_CustomerColumnModel> listColumnFold;
final RT_SKY_CustomerType listCustomerTypeFold;
final List<SKY_CustomerPartnerType> listCustomerPartnerTypeFold;
final List<SKY_CustomerZaloUser> listZaloUserFold;

  CustomerSkyCSCreateLoaded({
    required this.listGroupFold,
    required this.listColumnFold,
    required this.listCustomerTypeFold,
    required this.listCustomerPartnerTypeFold,
    required this.listZaloUserFold,
  });
}

class CustomerSkyCSCreateCheck extends CustomerSkyCSCreateLoaded {
  CustomerSkyCSCreateCheck({
    required super.listGroupFold,
    required super.listColumnFold,
    required super.listCustomerTypeFold,
    required super.listCustomerPartnerTypeFold,
    required super.listZaloUserFold,
  });
}

final class CustomerSkyCSCreateError extends CustomerSkyCSCreateState {

  CustomerSkyCSCreateError(this.message);
  final String message;
}

final class CustomerSkyCSCreateSuccess extends CustomerSkyCSCreateState {

}