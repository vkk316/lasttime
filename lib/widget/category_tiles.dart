import 'package:flutter/material.dart';
import 'package:lasttime/model/task.dart';

class CategoryTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...Task.categories
              .asMap()
              .map((index, value) => MapEntry(
                  index,
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(value),
                  )))
              .values
              .toList()
        ],
      ),
    );
  }

  // List<Widget> _buildCategoryBoxes(){
  //   List<Widget> buttons;
  //   Task.categories.asMap().map((index, value) => )
  // }
}
