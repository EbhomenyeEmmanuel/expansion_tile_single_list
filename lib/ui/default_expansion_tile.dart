import 'package:flutter/material.dart';

import '../model/model.dart';

class DefaultExpansionTile extends StatelessWidget {
  const DefaultExpansionTile(
      {super.key,
      this.title,
      this.onParentTileExpanded,
      this.items = const [],
      this.onCategoryChanged,
      this.isGettingItems = false,
      this.onSubCategory1Changed,
      this.isGettingSubItems = false});

  final String? title;
  final VoidCallback? onParentTileExpanded;
  final List<ExpansionItem> items;
  final ValueChanged<ExpansionItem>? onCategoryChanged;
  final bool isGettingItems;
  final ValueChanged<ExpansionSubItem>? onSubCategory1Changed;
  final bool isGettingSubItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (isOpen) async {},
          iconColor: Colors.black,
          title: Text((title != null) ? title! : ''),
          children: items.map((item) {
            return GestureDetector(
              child: ExpansionTile(
                enabled: !isGettingSubItems,
                trailing: isGettingSubItems
                    ? const SizedBox(
                        height: 14,
                        width: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : null,
                onExpansionChanged: (isOpen) async {
                  if (isOpen && onCategoryChanged != null) {
                    onCategoryChanged!(item);
                  }
                },
                iconColor: Colors.black,
                title: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  //textAlign: align,
                  //maxLines: maxLines,
                  softWrap: true,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 21.56 / 16,
                    color: Colors.black,
                  ),
                ),
                children: (item.subItems).map((subItem) {
                  return ExpansionTile(
                      enabled: !isGettingSubItems,
                      onExpansionChanged: (isOpen) {
                        if (isOpen && onSubCategory1Changed != null) {
                          onSubCategory1Changed!(subItem);
                        }
                      },
                      iconColor: Colors.black,
                      title: Text(
                        subItem.name,
                        overflow: TextOverflow.ellipsis,
                        // textAlign: align,
                        // maxLines: maxLines,
                        softWrap: true,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          height: 16 / 10,
                          color: Colors.black,
                        ),
                      ),
                      children: const []);
                }).toList(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
