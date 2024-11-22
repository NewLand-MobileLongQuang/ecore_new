part of 'eTicket_create_cubit.dart';

@immutable
sealed class eTicketCreateState {}

final class eTicketCreateInitial extends eTicketCreateState {}

final class eTicketCreateLoading extends eTicketCreateState {}

final class eTicketCreateStateLoaded extends eTicketCreateState {
  final SKY_ETicketTplCodesysModel gettemtpl;
  final List<SKY_EticketGroupModel> listETAlltemplateFold;
  final SKY_ETicketMstTagsModel listETMstTagsFold;
  final SKY_ETicket_Lst_Mst_Orgs_Model listETOrgFold;
  final SKY_ETicket_Lst_Priority_Model listETTicketPriorityFold;
  final SKY_ETicket_Lst_TicketSource_Model listETTicketSourceFold;
  final SKY_ETicket_Lst_Status_Model listETTicketStatusFold;
  final SKY_ETicket_Lst_ReceptionChannel_Model listETReceptionChannelFold;
  final SKY_ETicket_Lst_Type_Model listETicketTypeFold;
  final SKY_ETicket_Lst_CustomType_Model listETCustomTypeFold;
  final SKY_ETicket_Lst_Department_Model listETDepartmentFold;
  final List<SKY_CustomerInfo> listETcusFold;
  eTicketCreateStateLoaded( {
    required this.gettemtpl,
    required this.listETAlltemplateFold,
    required this.listETMstTagsFold,
    required this.listETOrgFold,
    required this.listETTicketPriorityFold,
    required this.listETTicketSourceFold,
    required this.listETTicketStatusFold,
    required this.listETReceptionChannelFold,
    required this.listETicketTypeFold,
    required this.listETCustomTypeFold,
    required this.listETDepartmentFold,
    required this.listETcusFold,
  });
}

final class eTicketCreateStateError extends eTicketCreateState {
final String message;

eTicketCreateStateError(this.message);
}
final class eTicketCreateStateSuccess extends eTicketCreateState {

}