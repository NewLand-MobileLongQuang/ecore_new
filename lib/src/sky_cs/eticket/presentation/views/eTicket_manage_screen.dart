import 'dart:developer';
import 'package:ecore/src/e_service/common/solution_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/common/widgets/loading_view.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/media_res.dart';
import '../../../../../core/res/strings.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/services/injection/injection_container.dart';
import '../../../../../core/utils/localization_helper.dart';
import '../../../../../core/utils/string_generate.dart';
import '../../domain/entities/sky_eticket_info.dart';
import '../cubit/eTicket_manage_cubit/eTicket_manage_cubit.dart';
import 'eTicket_create.dart';
import 'eTicket_detail.dart';

class ETicketManageScreen extends StatelessWidget {
  const ETicketManageScreen({super.key});

  static const routeName = 'eTicket';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => eTicketManageCubit(searchEticketSkyCSUseCase: sl(), mergeEticketSkyCSUseCase: sl())..init(),
      child: const ETicketSkyCSManageUIScreen(),
    );
  }
}

class ETicketSkyCSManageUIScreen extends StatefulWidget {
  const ETicketSkyCSManageUIScreen({super.key});

  @override
  State<ETicketSkyCSManageUIScreen> createState() => _ETicketManageScreenState();
}

class _ETicketManageScreenState extends State<ETicketSkyCSManageUIScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmptyData = true;
  final List<String> _selectedItems = []; // Track selected item IDs
  bool _isSelectionMode = false; // Flag to indicate selection mode
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      print("CHECK ETICKET MANAGe2213131");
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        context.read<eTicketManageCubit>().loadMore();
      }
    });
    //context.read<eTicketManageCubit>().init();
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

  AppBar _buildAppBar(LocalizationHelper l) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        icon: const Icon(
          FontAwesomeIcons.chevronLeft,
          color: AppColors.textWhiteColor,
          size: 20,
        ),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text(
        l(AppStrings.manageCustomer),
        style: AppTextStyles.textStyleInterW500S18White,
        maxLines: 2,
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
                      Navigator.pushNamed(context, 'advanced-search');
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
        listener: (context, state) {
          if (state is eTicketCreateStateSuccess) {
            context.read<eTicketManageCubit>().init();
          }
          if (state is eTicketManageError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.textRedColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is eTicketManageLoading) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.textWhiteColor,
              child: const LoadingView(),
            );
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
          return const Center(
            child: Text('No ETickets found'),
          );
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
          // context.pushNamed(
          //   ETicketDetailScreen.routeName,
          //   arguments: {
          //     'ETID': eticket.TicketID,
          //   },
          // );
          context.pushNamed(
            ETicketDetailScreen.routeName,
            arguments: {
              'ETID': eticket.TicketID,
            },
          );
          // context.pushNamed(
          //   ETicketDetailScreen.routeName,
          //   arguments: eticket.TicketID,
          // ).then((value) {
          //   if (value != null && value == true) {
          //     context.read<eTicketManageCubit>().init();
          //   }
          // });
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
            context.pushNamed(
              ETicketCreateScreen.routeName,
            ).then((value) {
              if (value != null && value == true) {
                context.read<eTicketManageCubit>().init();
              }
            });
            //Navigator.pushNamed(context, 'eTicket_create');
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
