import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';

import '../../../../../core/utils/string_generate.dart';
import '../../domain/entities/sky_eticket_getticketID.dart';

class InteractView extends StatefulWidget {
  const InteractView({super.key, required this.ETdetail,
    required this.onSelectionChanged});

  final SKY_GetTicketID ETdetail;
  final Function(List<int>) onSelectionChanged;

  @override
  State<InteractView> createState() => _InteractViewState();
}

class _InteractViewState extends State<InteractView> {
  List<int> selectedItems = [];

  @override
  void initState() {
    super.initState();
  }

  void _onItemLongPress(int index) {
    print("CHECK INDEX ${index}");
    setState(() {
      if (selectedItems.contains(index)) {
        selectedItems.remove(index); // Bỏ chọn item
      } else {
        selectedItems.add(widget.ETdetail.Lst_ET_TicketMessage[index].AutoId); // Chọn item
      }
      print(selectedItems);
      widget.onSelectionChanged(selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height, // Specify the height
      child: ListView.separated(
        itemCount: widget.ETdetail.Lst_ET_TicketMessage.length,
        separatorBuilder: (context, index) => Container(height: 1, color: AppColors.divideColor),
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () => _onItemLongPress(index),
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: selectedItems.contains(index)
                    ? AppColors.primaryColor.withOpacity(0.2)
                    : AppColors.textWhiteColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        child: Text(
                          StringGenerate.getCurrentTitle(widget.ETdetail.Lst_ET_TicketMessage[index].AgentName).toUpperCase(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.ETdetail.Lst_ET_TicketMessage[index].AgentName,
                          style: AppTextStyles.textStyleInterW500S14Black,
                          maxLines: 3,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.timer),
                            Text(
                              widget.ETdetail.Lst_ET_TicketMessage[index].MsgDTime,
                              style: AppTextStyles.textStyleInterW500S14Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Tiêu đề',
                            ),
                            Expanded(child: Container()), // Đẩy nội dung sang bên phải
                            Expanded(
                              child: Text(
                                widget.ETdetail.Lst_ET_TicketMessage[index].Description,
                                style: AppTextStyles.textStyleInterW500S12Black,
                                softWrap: true,
                                maxLines: null,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
