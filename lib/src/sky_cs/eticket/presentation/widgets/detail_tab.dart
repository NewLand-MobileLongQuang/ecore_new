import 'package:flutter/material.dart';

import '../../../../../core/res/colors.dart';
import '../../../../../core/res/text_styles.dart';
import '../../domain/entities/sky_eticket_getticketID.dart';

class ViewDetail extends StatelessWidget {
  const ViewDetail({Key? key, required this.type ,required this.ETdetail}) : super(key: key);

  final String type;
  final SKY_GetTicketID ETdetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _detailRow('Kênh phản hồi mong muốn:', 'Zalo'),
              const SizedBox(height: 8),
              _detailContainerRow('Trạng thái:', ETdetail.Lst_ET_Ticket[0].TicketStatus),
              const SizedBox(height: 8),
              _detailRow('Phân loại:', 'Hỗ trợ khách hàng'),
              const SizedBox(height: 8),
              _detailRow('Deadline:', ETdetail.Lst_ET_Ticket[0].TicketDeadline),
              const SizedBox(height: 8),
              _detailRow('Mức ưu tiên:', ETdetail.Lst_ET_Ticket[0].TicketPriority),
              const SizedBox(height: 8),
              _detailRow('Chi nhánh/ĐL phụ trách:', ETdetail.Lst_ET_Ticket[0].NNTFullName),
              const Divider(
                color: AppColors.divideColor,
                thickness: 1,
              ),
              const SizedBox(height: 8),
              _detailRow('Phân loại tùy chọn:', ETdetail.Lst_ET_Ticket[0].TicketType),
              const SizedBox(height: 8),
              _detailRow('Nguồn:', 'Dự án'),
              const SizedBox(height: 8),
              _detailRow('Kênh tiếp nhận:', ETdetail.Lst_ET_Ticket[0].ReceptionChannel),
              const SizedBox(height: 8),
              _detailContainerRow('Tags:', ETdetail.Lst_ET_Ticket[0].Tags),
              const SizedBox(height: 8),
              _detailContainerRow('Người theo dõi:', ETdetail.Lst_ET_Ticket[0].ListFollowerAgentName),
              const SizedBox(height: 8),
              _detailRow('SLA:',  ETdetail.Lst_ET_Ticket[0].SLAID),
              const SizedBox(height: 8),
              _detailRow('Người tạo:', ETdetail.Lst_ET_Ticket[0].AgentNameCreate),
              const SizedBox(height: 8),
              _detailRow('Thời gian tạo:', ETdetail.Lst_ET_Ticket[0].CreateDTimeUTC),
              const SizedBox(height: 8),
              _detailRow('Người cập nhật cuối:', ETdetail.Lst_ET_Ticket[0].AgentNamePrevious),
              const SizedBox(height: 8),
              _detailRow('Thời gian cập nhật cuối:', ETdetail.Lst_ET_Ticket[0].DTimeSys),
              const SizedBox(height: 8),
              _detailRow('Nhắc việc:', ETdetail.Lst_ET_Ticket[0].TicketWarning),
              const SizedBox(height: 8),
              _detailRow('Vào lúc:', ETdetail.Lst_ET_Ticket[0].DTimeSys),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.textStyleInterW400S14Grey,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.textStyleInterW500S14Black,
            textAlign: TextAlign.right,
            maxLines: null,
          ),
        ),
      ],
    );
  }

  Widget _detailContainerRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.textStyleInterW400S14Grey,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: value == "Open"
                ? Colors.yellow[800]
                : value == "Processing"
                ? Colors.orange[700]
                : value == "Closed"
                ? Colors.grey
            : value == "Sloved"
            ? Colors.grey :Colors.green[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: AppTextStyles.textStyleInterW400S11White,
          ),
        ),
      ],
    );
  }

}
