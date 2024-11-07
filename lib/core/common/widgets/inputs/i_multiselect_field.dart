import 'package:flutter/material.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../res/colors.dart';
import '../../../res/text_styles.dart';

class IMultiSelectField<T> extends StatelessWidget {
  const IMultiSelectField({
    Key? key,
    this.hintText = 'Please select options',
    required this.options,
    required this.getLabel,
    required this.selectedValues,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final List<T> options;
  final List<T> selectedValues;
  final String Function(T) getLabel;
  final void Function(List<T>?) onChanged;

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      items: options.map((T value) {
        return MultiSelectItem<T>(value, getLabel(value));
      }).toList(),
      searchable: true,
      title: Expanded(
        child: Text(
          hintText,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.textStyleInterW400S16Black,
        ),
      ),
      selectedColor: AppColors.primaryColor,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      buttonIcon: const Icon(
        Icons.arrow_drop_down,
        color: AppColors.textGreyColor,
      ),
      buttonText: Text(
        hintText,
        style: AppTextStyles.textStyleInterW400S14Grey,
        overflow: TextOverflow.ellipsis,
      ),
      initialValue: selectedValues,
      onConfirm: onChanged,
      chipDisplay: MultiSelectChipDisplay(
        items: selectedValues.map((T value) {
          return MultiSelectItem<T>(value, getLabel(value));
        }).toList(),
        chipColor: AppColors.primaryColor,
        textStyle: AppTextStyles.textStyleInterW400S16White,
        onTap: (T value) {
          selectedValues.remove(value);
          onChanged(selectedValues);
        },
        height: 90,
      ),
    );
  }
}
