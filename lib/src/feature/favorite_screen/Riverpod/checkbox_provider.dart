import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:morsl_app_celina0057/data/model/food_model.dart';
import 'package:morsl_app_celina0057/provider/food_provider.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/state_model/check_selected_model.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/state_model/checkbox_model.dart';

import '../../../../data/services/hive_box_services.dart';

final checkProvider = StateNotifierProvider<CheckNotifier, CheckboxModel>((
  ref,
) {
  return CheckNotifier(ref);
});

class CheckNotifier extends StateNotifier<CheckboxModel> {
  final Ref _ref;

  CheckNotifier(this._ref)
    : super(CheckboxModel(isSelected: false, selectedItems: [])) {
    final foodState = _ref.read(foodProviderFamily(null));
    final count = foodState.foods.length;

    state = state.copyWith(selectedItems: List.generate(count, (_) => false));
  }

  void toggleSelectionMode() {
    state = state.copyWith(isSelected: !state.isSelected);
  }

  void toggleAll() {
    final allSelected = !state.isAllSelected;
    final updatedSelections = List.generate(
      state.selectedItems.length,
      (_) => allSelected,
    );
    state = state.copyWith(selectedItems: updatedSelections);
  }

  void toggleItem(int index) {
    final updated = List<bool>.from(state.selectedItems);
    updated[index] = !updated[index];
    state = state.copyWith(selectedItems: updated);
  }

  Future<List<Map<String, dynamic>>> selectedList() async {
    final foods = await HiveServices.getFromHive(
      boxName: 'favourite',
    ); // Get the food state

    print(state.selectedItems.length);
    return state.selectedItems
        .asMap()
        .entries
        .where((element) => element.value == true) // Check for selected items
        .map(
          (e) => foods[e.key],
        ) // Use the index (e.key) to fetch the selected food from the list
        .toList();
  }
}




// ✅ StateNotifierProvider
final checkHiveProvider =
    StateNotifierProvider<CheckHiveNotifier, List<CheckSelectedModel>>((ref) {
  return CheckHiveNotifier();
});

class CheckHiveNotifier extends StateNotifier<List<CheckSelectedModel>> {
  CheckHiveNotifier() : super([]);

  /// ✅ Load data from Hive and initialize checkbox state
  Future<void> initializeFromHive() async {
    final favouriteFoods = await HiveServices.getFromHive(boxName: 'favourite');

    final convertedList = favouriteFoods.map((foodMap) {
      final food = FoodModel.fromJson(foodMap);
      return CheckSelectedModel(food: food, isSelected: false);
    }).toList();

    state = convertedList;
  }

  /// ✅ Toggle selection for a specific index
  void toggleSelection(int index) {
    final updated = [...state];
    final current = updated[index];
    updated[index] = current.copyWith(isSelected: !(current.isSelected ?? false));
    state = updated;
  }

  /// ✅ Select or deselect all
  void toggleSelectAll(bool value) {
    state = state.map((item) => item.copyWith(isSelected: value)).toList();
  }

  /// ✅ Get only selected items
  List<CheckSelectedModel> getSelected() {
    return state.where((e) => e.isSelected == true).toList();
  }

  /// ✅ Delete selected items from Hive and update state
  Future<void> deleteSelected() async {
    final selected = getSelected();
    final List<String> ids = selected.map((e) => e.food!.id).toList();
    print(ids);
    await HiveServices.selectedFoodClear(boxName: 'favourite', ids: ids);

    // Re-initialize list from Hive after deletion
    await initializeFromHive();
  }
}














// class CheckNotifier extends StateNotifier<CheckboxModel> {
//   final Ref _ref;

//   CheckNotifier(this._ref)
//       : super(CheckboxModel(isSelected: false, selectedItems: [])) {
//     _initializeSelections();
//   }

//   Future<void> _initializeSelections() async {
//     final foodState = _ref.read(foodProviderFamily(null));
//     final allFoods = foodState.foods;

//     final box = await Hive.openBox('favourite');

//     final selections = allFoods.map((food) => box.containsKey(food.id)).toList();

//     state = state.copyWith(selectedItems: selections);
//   }

//   void toggleSelectionMode() {
//     state = state.copyWith(isSelected: !state.isSelected);
//   }

//   Future<void> toggleAll() async {
//     final foodState = _ref.read(foodProviderFamily(null));
//     final allFoods = foodState.foods;

//     final shouldSelectAll = !state.isAllSelected;
//     final updatedSelections = List.generate(allFoods.length, (_) => shouldSelectAll);

//     for (int i = 0; i < allFoods.length; i++) {
//       final food = allFoods[i];
//       final id = food.id;

//       if (shouldSelectAll) {
//         await HiveServices.saveToHive(
//           boxName: 'favourite',
//           key: id,
//           data: food.toJson(),
//         );
//       } else {
//         await HiveServices.selectedFoodClear(
//           boxName: 'favourite',
//           ids: [id],
//         );
//       }
//     }

//     state = state.copyWith(selectedItems: updatedSelections);
//   }

//   Future<void> toggleItem(int index) async {
//     final foodState = _ref.read(foodProviderFamily(null));
//     final food = foodState.foods[index];
//     final id = food.id;

//     final updated = List<bool>.from(state.selectedItems);
//     updated[index] = !updated[index];

//     if (updated[index]) {
//       await HiveServices.saveToHive(
//         boxName: 'favourite',
//         key: id,
//         data: food.toJson(),
//       );
//     } else {
//       await HiveServices.selectedFoodClear(
//         boxName: 'favourite',
//         ids: [id],
//       );
//     }

//     state = state.copyWith(selectedItems: updated);
//   }

//   Future<List<Map<String, dynamic>>> selectedList() async {
//     final foodState = _ref.read(foodProviderFamily(null));
//     final allFoods = foodState.foods;

//     return state.selectedItems.asMap().entries
//         .where((entry) => entry.value)
//         .map((entry) => allFoods[entry.key].toJson())
//         .toList();
//   }
//   void resetSelection(int newCount) {
//   state = CheckboxModel(
//     isSelected: false,
//     selectedItems: List.generate(newCount, (_) => false),
//   );
// }
// }
