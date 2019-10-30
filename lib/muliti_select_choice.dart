/// @desp:标签选择器
/// @time 2019/5/13 11:20
/// @author lizubing
import 'package:flutter/material.dart';
import 'package:multi_choice_chip/select_choice_chip.dart';

import 'base_select_entity.dart';

class MultiSelectChip<T extends BaseSelectEntity> extends StatefulWidget {
  /// 标签的list
  final List<T> dataList;

  /// 标签的list
  final List<T> selectList;

  ///选择回调事件
  final Function(List<T>) onSelectionChanged;

  MultiSelectChip(this.dataList, {this.selectList, this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState(selectList);
}

class _MultiSelectChipState<T extends BaseSelectEntity>
    extends State<MultiSelectChip> {
  List<T> selectList;

  _MultiSelectChipState(this.selectList);

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.dataList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(4),
        child: SelectChoiceChip(
          text: item.getTag(),
          selected: selectList.contains(item),
          onSelected: (selected) {
            setState(() {
              selectList.contains(item)
                  ? selectList.remove(item)
                  : selectList.add(item);
              widget.onSelectionChanged(selectList);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      children: _buildChoiceList(),
    );
  }
}
