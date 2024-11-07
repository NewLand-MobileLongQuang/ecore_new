import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/strings.dart';

class ISearch extends StatefulWidget {
  const ISearch({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;

  @override
  State<ISearch> createState() => _ISearchState();
}

class _ISearchState extends State<ISearch> {
  bool isEmptyData = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value) {
        widget.onChanged!(value);
        setState(() {
          isEmptyData = value.isEmpty;
        });
      },
      onSubmitted: (value) {
        widget.onSubmitted!(value);
        setState(() {
          isEmptyData = value.isEmpty;
        });
      },
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: AppStrings.search,
        filled: true,
        fillColor: AppColors.greenLightColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
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
                      Navigator.pushNamed(context, '/advanced-search', arguments: {'function': 'guarantee_manage', 'module': 'eService'});
                    },
                  ),
                ],
              )
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  widget.controller?.clear();
                  widget.onChanged!('');
                  setState(() {
                    isEmptyData = true;
                  });
                },
              ),
      ),
    );
  }
}
