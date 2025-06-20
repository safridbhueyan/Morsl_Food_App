class CheckboxModel {
  final bool isSelected; // selection mode (shows checkboxes or not)
  final List<bool> selectedItems;

  CheckboxModel({required this.isSelected, required this.selectedItems});

  CheckboxModel copyWith({bool? isSelected, List<bool>? selectedItems}) {
    return CheckboxModel(
      isSelected: isSelected ?? this.isSelected,
      selectedItems: selectedItems ?? this.selectedItems,
    );
  }

  bool get isAllSelected =>
      selectedItems.isNotEmpty && selectedItems.every((e) => e);
}
