import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../core/common/widgets/inputs/i_select_field.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/strings.dart';
import '../../../../../core/res/text_styles.dart';
import '../../domain/entities/sky_eticket_getticketID.dart';
import '../cubit/eTicket_detail_cubit/eTicket_detail_cubit.dart';
import '../widgets/Filedoc_tab.dart';
import '../widgets/NNNCreate_tab.dart';
import '../widgets/detail_tab.dart';
import '../widgets/interact_tab.dart';

class ETicketDetailScreen extends StatefulWidget {
  final String eTID;
  const ETicketDetailScreen({super.key, required this.eTID });

  static const routeName = 'eTicket-detail';

  @override
  State<ETicketDetailScreen> createState() => _eTicketDetailScreenState();
}

class _eTicketDetailScreenState extends State<ETicketDetailScreen> {
  TextEditingController phoneController = TextEditingController();
  //final List<String> listPhone = ['0123456789', '0123456788', '0123456787', '0123456786'];
  late String eTID;
  bool hasSelectedItems = false;
  List<int> selectedItems = [];

  @override
  void initState() {
    print("TrungLQ: AÂNSBAbnsbab");
    //phoneController.text = listPhone.first;
    eTID= widget.eTID;
    super.initState();
    context.read<eTicketDetailCubit>().init(eTID);
  }

  void updateSelectedItemsStatus(List<int> selected) {
    setState(() {
      selectedItems = selected;
      hasSelectedItems = selected.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<eTicketDetailCubit, eTicketDetailState>(
        builder: (context, state) {
          if (state is eTicketDetailStateLoaded) {
            return DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.textWhiteColor,
                ),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
              title: _textTitle(),
              actions: [
                // Hiển thị nút Tách Ticket nếu có item được chọn

                  IconButton(
                    icon: const Icon(Icons.splitscreen),
                    onPressed: () {
                      splitSelectedItems(context,selectedItems);
                      print("Tách ticket cho các item đã chọn $selectedItems");
                    },
                  ),

              ],
            ),
            body: Column(
                children: [
                  _customerView(state.ETID),
                  _tabBar(),
                  _tabBarView(state.ETID),
                ]
            ),
          ),
        );
          }
          else if (state is eTicketDetailStateError) {
              return Center(child: Text('Error: ${state.message}'));
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
    );
  }


  Widget _textTitle() {
    return Text(
      AppStrings.eTicketdetail,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _customerView(SKY_GetTicketID ETinfo) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(ETinfo.Lst_ET_Ticket[0].TicketName
            ,style: AppTextStyles.textStyleInterW400S16Black,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(ETinfo.Lst_ET_TicketCustomer[0].CustomerAvatarPath),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          ETinfo.Lst_ET_TicketCustomer[0].CustomerName,
                          style: AppTextStyles.textStyleInterW400S16Black,
                          overflow: TextOverflow.ellipsis
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                              child: ISelectField(
                                options: ETinfo.Lst_ET_TicketCustomer[0].Lst_CustomerPhoneNo,
                                hintText: 'Phone',
                                value: phoneController.text,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    phoneController.text = newValue;
                                  }
                                },
                              )
                          ),
                          const SizedBox(width: 16),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: const Icon(
                                Icons.call,
                                size: 28,
                                color: AppColors.textWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              )
            ],
          ),
        ],
      )

    );
  }

  Widget _tabBar() {
    return SizedBox(
      height: 50,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        tabs: const [
          Tab(
            text: 'Tương tác',
          ),
          Tab(
            text: 'Chi tiết',
          ),
          Tab(
            text: 'Tài liệu đính kèm ',
          ),
          Tab(
            text: 'Đơn vị tạo',
          ),
        ],
        indicatorColor: AppColors.primaryColor,
        labelColor: AppColors.primaryColor,
        labelStyle: AppTextStyles.textStyleInterW500S14Black,
      ),
    );
  }

  Widget _tabBarView(SKY_GetTicketID etid) {
    return Expanded(
      child: TabBarView(
        children: [
          ListViewCustomerDetail(type: 'Tương tác', ETdetail: etid, updateSelectedItemsStatus: updateSelectedItemsStatus,),
          ViewDetail(type: 'Chi tiết', ETdetail: etid),
          ListViewCustomerDetailFile(type: 'Tài liệu đính kèm', ETdetail: etid),
          CreateDetail(type: 'Đơn vị tạo', ETdetail: etid),
        ],
      ),
    );
  }

  void splitSelectedItems(BuildContext context, List<int> selectedItems) {
      final cubit = context.read<eTicketDetailCubit>();
      cubit.split(selectedItems,context);
      print("Merging items: $selectedItems");
    }
  }


class ListViewCustomerDetail extends StatefulWidget {
  const ListViewCustomerDetail({super.key, required this.type,required this.ETdetail, required this.updateSelectedItemsStatus});

  final String type;
  final SKY_GetTicketID ETdetail;
  final  Function(List<int>) updateSelectedItemsStatus;

  @override
  State<ListViewCustomerDetail> createState() => _ListViewCustomerDetailState();
}

class _ListViewCustomerDetailState extends State<ListViewCustomerDetail> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if(widget.type == 'Tương tác') {
          return InteractView(ETdetail: widget.ETdetail,onSelectionChanged: widget.updateSelectedItemsStatus);
        }
        if (widget.type == 'Tài liệu đính kèm') {
          return Slidable(
            key: ValueKey(index),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Implement add action here
                  },
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  icon: Icons.more_horiz,
                  label: 'Thêm',
                ),
                SlidableAction(
                  onPressed: (context) {
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Xóa',
                ),

              ],
            ),
            child: FiledocView(ETATFile: widget.ETdetail.Lst_ET_TicketAttachFile),
          );
        }
        return Container();
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: AppColors.divideColor,
      ),
      itemCount: 10,
    );
  }
}
class ListViewCustomerDetailFile extends StatefulWidget {
  const ListViewCustomerDetailFile({super.key, required this.type,required this.ETdetail});

  final String type;
  final SKY_GetTicketID ETdetail;

  @override
  State<ListViewCustomerDetailFile> createState() => _ListViewCustomerDetailFileState();
}

class _ListViewCustomerDetailFileState extends State<ListViewCustomerDetailFile> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (widget.type == 'Tài liệu đính kèm') {
          return Slidable(
            key: ValueKey(index),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Implement add action here
                  },
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  icon: Icons.more_horiz,
                  label: 'Thêm',
                ),
                SlidableAction(
                  onPressed: (context) {
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Xóa',
                ),

              ],
            ),
            child: FiledocView(ETATFile: widget.ETdetail.Lst_ET_TicketAttachFile),
          );
        }
        return Container();
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: AppColors.divideColor,
      ),
      itemCount: 10,
    );
  }
}



