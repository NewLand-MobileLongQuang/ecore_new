import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ecore/core/common/widgets/inputs/i_camera.dart';
import 'package:ecore/core/res/colors.dart';
import 'package:ecore/core/res/strings.dart';
import 'package:ecore/src/e_service/guarantee_manage/domain/entities/es_warranty_attach_file.dart';

import 'package:ecore/src/e_service/repair_manage/domain/entities/es_ro_attach_file.dart';

import '../../../../core/res/text_styles.dart';
import '../../index/presentation/views/image_page_view.dart';



class IScrollImage extends StatefulWidget {
  const IScrollImage({
    this.listFile,
    this.listWarrantyAttachFile,
    this.listROAttachFile,
    this.flagGallery,
    this.flagCamera,
    this.flagDelete,
    this.title,
    super.key,
  });

  final List<File?>? listFile;
  final List<ES_WarrantyAttachFile>? listWarrantyAttachFile;
  final List<ES_ROAttachFile>? listROAttachFile;
  final bool? flagGallery;
  final bool? flagCamera;
  final bool? flagDelete;
  final String? title;

  @override
  State<IScrollImage> createState() => _IScrollImageState();
}

class _IScrollImageState extends State<IScrollImage> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              widget.title ?? AppStrings.installImage,
              style: AppTextStyles.textStyleInterW600S16Black,
            ),
            Expanded(child: Container()),
            if(widget.flagGallery != null)...[
              InkWell(
                onTap: () async {
                  if((widget.listWarrantyAttachFile?.length ?? 0)
                      + (widget.listFile?.length ?? 0)
                      + (widget.listROAttachFile?.length ?? 0) < 3
                  ){
                    final imageFromGallery = await ICamera.pickImageFromGallery();
                    setState(() {
                      widget.listFile?.add(imageFromGallery);
                    });
                  }
                },
                child: Container(
                  height: 36,
                  width: 48,
                  decoration: BoxDecoration(
                    color: (widget.listWarrantyAttachFile?.length ?? 0)
                        + (widget.listFile?.length ?? 0)
                        + (widget.listROAttachFile?.length ?? 0) == 3
                        ? AppColors.buttonGreyColor
                        : AppColors.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 20,
                    color: AppColors.textWhiteColor,
                  ),
                ),
              ),
            ],
            if(widget.flagCamera != null && widget.flagCamera != null)...[
              const SizedBox(width: 4),
            ],
            if(widget.flagCamera != null)...[
              InkWell(
                onTap: () async {
                  if((widget.listWarrantyAttachFile?.length ?? 0)
                      + (widget.listFile?.length ?? 0)
                      + (widget.listROAttachFile?.length ?? 0) < 3
                  ){
                    final imageFromCamera = await ICamera.pickImageFromCamera();
                    setState(() {
                      widget.listFile?.add(imageFromCamera);
                    });
                  }
                },
                child: Container(
                  height: 36,
                  width: 48,
                  decoration: BoxDecoration(
                    color: (widget.listFile?.length ?? 0)
                        + (widget.listWarrantyAttachFile?.length ?? 0)
                        + (widget.listROAttachFile?.length ?? 0) == 3
                        ? AppColors.buttonGreyColor
                        : AppColors.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: AppColors.textWhiteColor,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 16),
        if(
            (widget.listFile?.length ?? 0)
              + (widget.listWarrantyAttachFile?.length ?? 0)
              + (widget.listROAttachFile?.length ?? 0) == 0)
        ...[
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.greenLightColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                AppStrings.installImageNote,
                style: AppTextStyles.textStyleInterW400S14Grey,
              ),
            ),
          ),
        ]
        else ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if(_currentPage != 0)...[
                InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () {
                    setState(() {
                      _currentPage--;
                      _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                    });
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: AppColors.textBlackColor,
                    size: 48,
                  ),
                ),
              ],
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemCount: (widget.listFile?.length ?? 0)
                          + (widget.listWarrantyAttachFile?.length ?? 0)
                          + (widget.listROAttachFile?.length ?? 0),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ImagePageView(
                                  Lst_ES_WarrantyAttachFile: widget.listWarrantyAttachFile ?? const [],
                                  Lst_ES_ROAttachFile: widget.listROAttachFile ?? const [],
                                  listFile: widget.listFile ?? const [],
                                  flagDelete: widget.flagDelete ?? false,
                                  index: index,
                                );
                              },
                            ).then((value) {
                              if (value == true) {
                                setState(() {
                                  if(widget.listWarrantyAttachFile != null){
                                    if(index < (widget.listWarrantyAttachFile!.length)){
                                      widget.listWarrantyAttachFile!.removeAt(index);
                                    }
                                    else {
                                      widget.listFile!.removeAt(index - (widget.listWarrantyAttachFile!.length));
                                    }
                                  }
                                  else {
                                    if(index < (widget.listROAttachFile!.length)){
                                      widget.listROAttachFile!.removeAt(index);
                                    }
                                    else {
                                      widget.listFile!.removeAt(index - (widget.listROAttachFile!.length));
                                    }
                                  }
                                });
                              }
                            });
                          },
                          child: widget.listWarrantyAttachFile != null
                              ? index < widget.listWarrantyAttachFile!.length
                              ? Image.network(widget.listWarrantyAttachFile?[index].FilePath ?? '')
                              : Image.file(widget.listFile?[index - widget.listWarrantyAttachFile!.length] ?? File(''))
                              : index < widget.listROAttachFile!.length
                              ? Image.network(widget.listROAttachFile?[index].FilePath ?? '')
                              : Image.file(widget.listFile?[index - widget.listROAttachFile!.length] ?? File('')),
                        );
                      },
                    ),
                  ),
                ),
              ),
              if(_currentPage != (widget.listFile?.length ?? 0)
                  + (widget.listWarrantyAttachFile?.length ?? 0)
                  + (widget.listROAttachFile?.length ?? 0) - 1)...[
                InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () {
                    setState(() {
                      _currentPage++;
                      _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                    });
                  },
                  child: const Icon(
                    Icons.chevron_right,
                    color: AppColors.textBlackColor,
                    size: 48,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
