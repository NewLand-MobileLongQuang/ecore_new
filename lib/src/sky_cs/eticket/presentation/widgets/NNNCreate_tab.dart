import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';

import '../../domain/entities/sky_eticket_getticketID.dart';

class CreateDetail extends StatelessWidget {
  const CreateDetail({Key? key, required this.type ,required this.ETdetail}) : super(key: key);

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
              _detailRow('Đơn vị tạo', ETdetail.Lst_ET_Ticket[0].NNTFullNameCreate),
              const SizedBox(height: 8),
              _detailRow('Phòng ban tạo:', ETdetail.Lst_ET_Ticket[0].DepartmentNameCreate),
              const SizedBox(height: 8),
              _detailRow('Agent tạo:',ETdetail.Lst_ET_Ticket[0].AgentName),
              const SizedBox(height: 8),
              _detailRow('Thời gian tạo:', ETdetail.Lst_ET_Ticket[0].CreateDTimeUTC),
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

}
