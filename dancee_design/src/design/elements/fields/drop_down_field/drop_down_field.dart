import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';

import '../../../../dancee_design_exports.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({super.key, required this.items, this.initialValue, this.onChange, this.style});

  final String? initialValue;
  final Map<String, String> items;
  final Function(String)? onChange;
  final DropDownFieldStyle? style;

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = widget.style!;

    return GestureDetector(
      onTap: _showDropDownList,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: currentStyle.border,
          enabledBorder: currentStyle.enabledBorder,
          focusedBorder: currentStyle.focusedBorder,
          contentPadding: currentStyle.contentPadding,
          hintText: _selectedValue,
          hintStyle: currentStyle.textStyle,
          fillColor: AppColors.white,
          filled: true,
        ),
        focusColor: AppColors.blue600,
        items: [],
        onChanged: (newValue) {},
        style: currentStyle.textStyle,
        icon: const Icon(CupertinoIcons.chevron_down, color: AppColors.grey400, size: 22, weight: 10),
        dropdownColor: currentStyle.dropdownColor,
      ),
    );
  }

  _showDropDownList() {
    DropDownState<String>(
      dropDown: DropDown<String>(
        isSearchVisible: false,
        data: <SelectedListItem<String>>[
          ...widget.items.entries.map((item) => SelectedListItem<String>(data: item.value)),
        ],
        onSelected: (selectedItems) {
          setState(() => _selectedValue = selectedItems.first.data);
          final selectedValueKey = widget.items.entries.where((e) => e.value == _selectedValue).first.key;
          widget.onChange?.call(selectedValueKey);
        },
      ),
    ).showModal(context);
  }
}
