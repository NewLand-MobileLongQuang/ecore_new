import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';

import '../../../../../core/res/media_res.dart';
import '../../domain/entities/sky_eticket_info.dart';
import '../cubit/eTicket_manage_cubit/eTicket_manage_cubit.dart';

class eTicketManageScreen extends StatefulWidget {
  const eTicketManageScreen({super.key});

  static const routeName = '/eTicket';

  @override
  State<eTicketManageScreen> createState() => _eTicketManageScreenState();
}

class _eTicketManageScreenState extends State<eTicketManageScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmptyData = true;
  final List<String> _selectedItems = []; // Track selected item IDs
  bool _isSelectionMode = false; // Flag to indicate selection mode

  @override
  void initState() {
    context.read<eTicketManageCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textWhiteColor,
          ),
          onPressed: () {
            if (_isSelectionMode) {
              _clearSelection();
            } else {
              Navigator.of(context).maybePop();
            }
          },
        ),
        title: _isSelectionMode
            ? Text('${_selectedItems.length} selected')
            : _textTitle(),
        actions: _isSelectionMode
            ? [
          IconButton(
            icon: const Icon(Icons.merge_type),
            onPressed: () => _mergeSelectedItems(context),

          ),
        ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            const SizedBox(height: 16),
            _listGuarantee(context),
            _buttonAdd(),
          ],
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.eTicketmanage,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }


  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
            },
            onSubmitted: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
            },
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              filled: true,
              fillColor: Colors.green[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              suffixIcon: isEmptyData == true
                  ? PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('Tìm kiếm nâng cao'),
                    onTap: () {
                      Navigator.pushNamed(context, '/advanced-search');
                    },
                  ),
                ],
              )
                  : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    isEmptyData = true;
                  });
                },
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
      ],
    );
  }

  Widget _listGuarantee(BuildContext context) {
    return Expanded(
      child: BlocConsumer<eTicketManageCubit, eTicketManageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is eTicketManageLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is eTicketManageLoaded) {
            return ListView.separated(
              itemCount: state.listeticket.length,
              separatorBuilder: (context, index) =>
                  Container(height: 1, color: AppColors.divideColor),
              itemBuilder: (context, index) {
                return _itemeTicket(context, state.listeticket[index]);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _itemeTicket(BuildContext context, SKY_TicketInfo eticket) {
    final isSelected = _selectedItems.contains(eticket.TicketID);

    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isSelectionMode = true;
          _selectedItems.add(eticket.TicketID);
        });
      },
      onTap: () {
        if (_isSelectionMode) {
          setState(() {
            if (isSelected) {
              _selectedItems.remove(eticket.TicketID);
              if (_selectedItems.isEmpty) {
                _isSelectionMode = false;
              }
            } else {
              _selectedItems.add(eticket.TicketID);
            }
          });
        } else {
          Navigator.pushNamed(context, '/eTicket_detail', arguments: {
            'ETID': eticket.TicketID,
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: isSelected ? Colors.blue[100] : AppColors.textWhiteColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          eticket.TicketName,
                          style: AppTextStyles.textStyleInterW400S16Black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        eticket.MsgDTime,
                        style: AppTextStyles.textStyleInterW400S14Grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(AppMediaRes.iconCallIn),
                            Text(
                              eticket.CustomerName,
                              style: AppTextStyles.textStyleInterW400S14Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        eticket.TicketStatus,
                        style: TextStyle(
                          color: eticket.TicketStatus == "OPEN"
                              ? Colors.yellowAccent[700]
                              : eticket.TicketStatus == "PROCESSING"
                              ? Colors.orangeAccent[700]
                              : eticket.TicketStatus == "CLOSED"
                              ? Colors.red[700]
                              : Colors.blue[400],
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          eticket.CreateBy,
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      CircleAvatar(
                        child: Text(
                          StringGenerate.getCurrentTitle(
                              eticket.CustomerName).toUpperCase(),
                          style: const TextStyle(fontSize: 16),
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
  }

  void _clearSelection() {
    setState(() {
      _isSelectionMode = false;
      _selectedItems.clear();
    });
  }

  void _mergeSelectedItems(BuildContext context) {
      final cubit = context.read<eTicketManageCubit>();
       cubit.merge(_selectedItems,context);
      print("Merging items: $_selectedItems");
    _clearSelection();
  }

  Widget _buttonAdd() {
    return Row(
      children: [
        Expanded(child: Container()),
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/eTicket_create');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size(64, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.textWhiteColor,
          ),
        ),
      ],
    );
  }
}
