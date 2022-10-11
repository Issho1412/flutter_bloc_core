import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/features/custom_dropdown/dropdown_bloc.dart';

import '../core/util/style/colors.dart';
import '../core/util/style/others.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final dropdownBloc = DropdownBloc();
  final double? buttonWidth, buttonHeight, dropdownWidth, dropdownMaxHeight;
  final List<T>? items;
  final T? selectedValue;
  final Function(T?)? onChanged;
  final Widget Function(T item)? itemDesign;
  final Widget? title;
  final String? hint;

  CustomDropdownButton({
    Key? key,
    this.buttonWidth = 100,
    this.buttonHeight = 35,
    this.dropdownWidth = 200,
    this.dropdownMaxHeight = 180,
    this.items,
    this.selectedValue,
    this.onChanged,
    this.itemDesign,
    this.title,
    this.hint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dropdownBloc.onChanged(selectedValue);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title ?? const SizedBox(),
        BlocBuilder<DropdownBloc, dynamic>(
            bloc: dropdownBloc,
            builder: (context, _) {
              return DropdownButtonHideUnderline(
                child: DropdownButton2<T>(
                  isExpanded: true,
                  hint: hint != null
                  ? Text(
                      hint!,
                      style: const TextStyle(
                        fontSize: StyleOthersConst.kSize,
                        color: ColorConst.kTxtDefault,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  : Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Select a option',
                            style: TextStyle(
                              fontSize: StyleOthersConst.kSize,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  items: items!
                      .map((item) => DropdownMenuItem<T>(
                            value: item,
                            child: itemDesign != null
                                ? Builder(
                                    builder: (context) {
                                      return itemDesign!(item);
                                    },
                                  )
                                : Text(
                                    item.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          ))
                      .toList(),
                  value: dropdownBloc.selectedItem,
                  onChanged: (value) {
                    onChanged != null ? onChanged!(value) : (value) {};
                    dropdownBloc.onChanged(value);
                  },
                  // icon: SvgPicture.asset(Assets.icon.arrowDown),
                  iconSize: 14,
                  buttonHeight: buttonHeight,
                  buttonWidth: buttonWidth,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: ColorConst.kTextHeadline6,
                    ),
                    color: Colors.white,
                  ),
                  buttonElevation: 0,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: dropdownMaxHeight,
                  dropdownWidth: dropdownWidth,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                  selectedItemHighlightColor: ColorConst.kTxtInfo,
                ),
              );
            })
      ],
    );
  }
}
