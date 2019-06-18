/// @desp:标签选择器
/// @time 2019/5/13 11:20
/// @author lizubing
import 'package:flutter/material.dart';

import 'base_select_entity.dart';
import 'border_choice_chip.dart';

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
        height: 31,
        padding: EdgeInsets.all(4),
        child: BorderChoiceChip(
          label: Text(
            item.getTag(),
            style: TextStyle(fontSize: 14),
          ),
          selected: selectList.contains(item),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          labelPadding: EdgeInsets.only(bottom: 9),
          padding: EdgeInsets.only(left: 12, right: 12, bottom: 9),
          selectedColor: Colors.white,
          backgroundColor: Colors.white,
          selectShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.blue, width: 0.5),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.black, width: 0.5),
          ),
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
