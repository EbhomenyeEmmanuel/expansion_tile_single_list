import 'expansion_sub_item.dart';

class ExpansionItem {
  final String name;
  final List<ExpansionSubItem> subItems;

  const ExpansionItem({required this.name, this.subItems = const []});
}
