import 'package:flutter/material.dart';

import '../model/model.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile(
      {super.key,
      this.title,
      this.onParentTileExpanded,
      this.items = const [],
      this.onItemChanged,
      this.isGettingItems = false,
      this.onSubItemChanged,
      this.isGettingSubItems = false});

  /// Parent title
  final String? title;

  /// Called if the parent tile is expanded
  final VoidCallback? onParentTileExpanded;

  /// List of expansions item and it's subItems.
  final List<ExpansionItem> items;

  /// Returns current selected item
  final ValueChanged<ExpansionItem>? onItemChanged;

  /// Displays a loader to indicate a loading state for items
  final bool isGettingItems;

  /// Returns current selected subItem
  final ValueChanged<ExpansionSubItem>? onSubItemChanged;

  /// Displays a loader to indicate a loading state for subItems
  /// This is displayed in case the selected item needs to change it's set of sub items
  final bool isGettingSubItems;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  ExpansionItem? selectedItem;

  bool get isSelectedItemValid => selectedItem != null;
  ExpansionSubItem? selectedSubItem;

  bool get isSelectedSubItemValid => selectedSubItem != null;

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
          onExpansionChanged: (isOpen) async {
            setState(() {
              selectedItem = null;
              selectedSubItem = null;
            });
            if (isOpen &&
                widget.items.isEmpty &&
                widget.onParentTileExpanded != null) {
              widget.onParentTileExpanded!();
            }
          },
          enabled: !widget.isGettingItems,
          trailing: widget.isGettingItems
              ? const SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : null,
          iconColor: Colors.black,
          title: Text(widget.title ?? ''),
          children: (isSelectedItemValid ? [selectedItem!] : (widget.items))
              .map((item) {
            return AnimatedContainer(
              duration: const Duration(microseconds: 30),
              child: GestureDetector(
                child: ExpansionTile(
                  enabled: !widget.isGettingSubItems,
                  trailing: (widget.isGettingSubItems && (selectedItem == item))
                      ? const SizedBox(
                          height: 14,
                          width: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : null,
                  onExpansionChanged: (isOpen) async {
                    setState(() {
                      selectedItem = item;
                    });
                    if (isOpen && widget.onItemChanged != null) {
                      widget.onItemChanged!(item);
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
                  children: (isSelectedSubItemValid
                          ? ([selectedSubItem!])
                          : (item.subItems))
                      .map((subItem) {
                    return ExpansionTile(
                        enabled: !widget.isGettingSubItems,
                        onExpansionChanged: (isOpen) {
                          setState(() {
                            selectedSubItem = subItem;
                          });
                          if (isOpen && widget.onSubItemChanged != null) {
                            widget.onSubItemChanged!(subItem);
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
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
