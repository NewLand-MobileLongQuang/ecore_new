import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/inputs/i_dialog.dart';
import '../../../../../core/res/colors.dart';
import '../../../../../core/res/strings.dart';
import '../../../guarantee_manage/domain/entities/es_warranty_attach_file.dart';
import '../../../repair_manage/domain/entities/es_ro_attach_file.dart';
import '../cubit/image_page_view/image_page_view_cubit.dart';

class ImagePageView extends StatefulWidget {
  ImagePageView({
    required this.Lst_ES_WarrantyAttachFile,
    required this.Lst_ES_ROAttachFile,
    required this.listFile,
    required this.flagDelete,
    required this.index,
    super.key,
  });

  final List<File?> listFile;
  final List<ES_WarrantyAttachFile> Lst_ES_WarrantyAttachFile;
  final List<ES_ROAttachFile> Lst_ES_ROAttachFile;
  final bool flagDelete;
  int index;
  @override
  State<ImagePageView> createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<ImagePageView> {
  PageController pageController = PageController();

  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImagePageViewCubit>(
        create: (context) => ImagePageViewCubit()..changeIndex(widget.index, null),
        child: BlocConsumer<ImagePageViewCubit, ImagePageViewState>(
          listener: (context, state) {
            if(state is ImagePageViewLoaded) {
              widget.index = state.index;
            }
          },
          builder: (context, state) {
            if(state is ImagePageViewLoaded) {
              return widget.Lst_ES_ROAttachFile.isEmpty
                  ? Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: widget.Lst_ES_WarrantyAttachFile.length + widget.listFile.length,
                    onPageChanged: (index) {
                      context.read<ImagePageViewCubit>().changeIndex(index, null);
                    },
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height - 40,
                          width: MediaQuery.of(context).size.width - 40,
                          child: index < widget.Lst_ES_WarrantyAttachFile.length
                              ? Image.network(
                            widget.Lst_ES_WarrantyAttachFile[index].FilePath ?? '',
                          )
                              : Image.file(
                            widget.listFile[index - widget.Lst_ES_WarrantyAttachFile.length]!,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Container(
                        height: 36,
                        width: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.buttonRedColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: AppColors.textWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 52,
                    child: widget.flagDelete == true ? IconButton(
                      onPressed: (){
                        IDialog.showConfirmDeleteDialog(
                          context,
                          AppStrings.confirmDeleteTitle,
                        ).then((value) {
                          if(value != null && value == true) {
                            Navigator.of(context).pop(true);
                          }
                        });
                      },
                      icon: Container(
                        height: 36,
                        width: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.buttonRedColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Icon(
                          Icons.delete,
                          size: 20,
                          color: AppColors.textWhiteColor,
                        ),
                      ),
                    ) : Container(),
                  ),
                  if(widget.index != 0)
                    Positioned(
                      left: 0,
                      top: MediaQuery.of(context).size.height / 2 - 20,
                      child: IconButton(
                          onPressed: (){
                            context.read<ImagePageViewCubit>().changeIndex(
                                widget.index - 1,
                                    () {
                                  pageController.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.linear
                                  );
                                }
                            );
                          },
                          icon: Container(
                            color: AppColors.blackOpa3,
                            child: Icon(
                              Icons.chevron_left,
                              size: MediaQuery.of(context).size.width / 6,
                              color: AppColors.textWhiteColor,
                            ),
                          )
                      ),
                    ),
                  if(widget.index != widget.listFile.length + widget.Lst_ES_WarrantyAttachFile.length - 1)
                    Positioned(
                      right: 0,
                      top: MediaQuery.of(context).size.height / 2 - 20,
                      child: IconButton(
                          onPressed: (){
                            context.read<ImagePageViewCubit>().changeIndex(
                                widget.index + 1,
                                    () {
                                  pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.linear
                                  );
                                }
                            );
                          },
                          icon: Container(
                            color: AppColors.blackOpa3,
                            child: Icon(Icons.chevron_right,
                              size: MediaQuery.of(context).size.width / 6,
                              color: AppColors.textWhiteColor,
                            ),
                          )
                      ),
                    ),
                ],
              )
                  : Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: widget.Lst_ES_ROAttachFile.length + widget.listFile.length,
                    onPageChanged: (index) {
                      context.read<ImagePageViewCubit>().changeIndex(index, null);
                    },
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height - 40,
                          width: MediaQuery.of(context).size.width - 40,
                          child: index < widget.Lst_ES_ROAttachFile.length
                              ? Image.network(
                            widget.Lst_ES_ROAttachFile[index].FilePath ?? '',
                          )
                              : Image.file(
                            widget.listFile[index - widget.Lst_ES_ROAttachFile.length]!,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Container(
                        height: 36,
                        width: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.buttonRedColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: AppColors.textWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 52,
                    child: widget.flagDelete == true ? IconButton(
                      onPressed: (){
                        IDialog.showConfirmDeleteDialog(
                          context,
                          AppStrings.confirmDeleteTitle,
                        ).then((value) {
                          if(value != null && value == true) {
                            Navigator.of(context).pop(true);
                          }
                        });
                      },
                      icon: Container(
                        height: 36,
                        width: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.buttonRedColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Icon(
                          Icons.delete,
                          size: 20,
                          color: AppColors.textWhiteColor,
                        ),
                      ),
                    ) : Container(),
                  ),
                  if(widget.index != 0)
                    Positioned(
                      left: 0,
                      top: MediaQuery.of(context).size.height / 2 - 20,
                      child: IconButton(
                          onPressed: (){
                            context.read<ImagePageViewCubit>().changeIndex(
                                widget. index - 1,
                                    () {
                                  pageController.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.linear
                                  );
                                }
                            );
                          },
                          icon: Container(
                            color: AppColors.blackOpa3,
                            child: Icon(
                              Icons.chevron_left,
                              size: MediaQuery.of(context).size.width / 6,
                              color: AppColors.textWhiteColor,
                            ),
                          )
                      ),
                    ),
                  if(widget.index != widget.listFile.length + widget.Lst_ES_ROAttachFile.length - 1)
                    Positioned(
                      right: 0,
                      top: MediaQuery.of(context).size.height / 2 - 20,
                      child: IconButton(
                          onPressed: (){
                            context.read<ImagePageViewCubit>().changeIndex(
                                widget.index + 1,
                                    () {
                                  pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.linear
                                  );
                                }
                            );
                          },
                          icon: Container(
                            color: AppColors.blackOpa3,
                            child: Icon(Icons.chevron_right,
                              size: MediaQuery.of(context).size.width / 6,
                              color: AppColors.textWhiteColor,
                            ),
                          )
                      ),
                    ),
                ],
              );
            }
            return Container();
          },
        )
    );
  }
}
