import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/text_styles.dart';

class ISelectField extends StatefulWidget {
  const ISelectField({
    this.hintText = '',
    required this.options,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String hintText;
  final List<String> options;
  final String value;
  final void Function(String) onChanged;

  @override
  State<ISelectField> createState() => _ISelectFieldState();
}

class _ISelectFieldState extends State<ISelectField> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          label: Text(
            widget.hintText,
            style: AppTextStyles.textStyleInterW400S16Black,
          ),
          labelStyle: AppTextStyles.textStyleInterW400S16Black,
        ),
        hint: Text(
          widget.hintText,
          style: AppTextStyles.textStyleInterW400S16Grey,
        ),
        items: widget.options
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: AppTextStyles.textStyleInterW400S16Black,
                  ),
                ))
            .toList(),
        value: widget.value,
        onChanged: (value) {
          widget.onChanged(value!);
        },
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                hintText: 'Tìm kiếm...',
                hintStyle: AppTextStyles.textStyleInterW400S16Grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value.toString().contains(searchValue);
          },
        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}

// class ISelectField<T> extends StatelessWidget {
//   const ISelectField({
//     this.hintText = '',
//     required this.options,
//     required this.getLabel,
//     required this.value,
//     required this.onChanged,
//     super.key,
//   });
//
//   final String hintText;
//   final List<T> options;
//   final T value;
//   final String Function(T) getLabel;
//   final void Function(T?) onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     final uniqueOptions = options.toSet().toList();
//
//     return FormField<T>(
//       builder: (FormFieldState<T> state) {
//         return DropdownButtonFormField<T>(
//
//           alignment: Alignment.bottomCenter,
//           items: uniqueOptions.map((T option) {
//             return DropdownMenuItem<T>(
//               value: option,
//               child: IntrinsicWidth(
//                   child: Text(
//                   getLabel(option),
//                   style: AppTextStyles.textStyleInterW400S14Black,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             );
//           }).toList(),
//           menuMaxHeight: 300,
//           onChanged: onChanged,
//           value: uniqueOptions.contains(value) ? value : options.first,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: const BorderSide(color: AppColors.primaryColor),
//             ),
//             filled: false,
//             contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             labelText: hintText,
//             hintText: hintText,
//             labelStyle: AppTextStyles.textStyleInterW400S16Black,
//             hintStyle: AppTextStyles.textStyleInterW400S16Black,
//           ),
//         );
//       },
//     );
//   }
// }
