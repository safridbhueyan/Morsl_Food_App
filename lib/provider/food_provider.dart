import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/food_model.dart';
import '../data/repository/food_repository.dart';
import '../data/services/hive_box_services.dart';

final foodRepositoryProvider = Provider<FoodRepository>((ref) => FoodRepository());

class FoodState {
  final List<FoodModel> foods;
  final bool isLoading;
  final bool hasMore;
  final int page;

  FoodState({
    required this.foods,
    required this.isLoading,
    required this.hasMore,
    required this.page,
  });

  FoodState copyWith({
    List<FoodModel>? foods,
    bool? isLoading,
    bool? hasMore,
    int? page,
  }) {
    return FoodState(
      foods: foods ?? this.foods,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }

  factory FoodState.initial() => FoodState(
    foods: [],
    isLoading: false,
    hasMore: true,
    page: 1,
  );
}

class FoodNotifier extends StateNotifier<FoodState> {
  final FoodRepository repository;
  final String? category;

  FoodNotifier(this.repository, this.category) : super(FoodState.initial()) {
    fetchFoods();
  }

  Future<void> fetchFoods() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);

    try {
      // Fetch foods from repository
      final foods = await repository.fetchFoods(
        category: category,
        page: state.page,
      );
      debugPrint(foods.length.toString());
      foods.add(FoodModel(id: '', name: '', category: '', image: foods[0].image, createdAt: DateTime.now()));
      foods.add(FoodModel(id: '', name: '', category: '', image: foods[0].image, createdAt: DateTime.now()));
      debugPrint(foods.length.toString());

      // Get the list of already saved food items from Hive (e.g., favourites and delete)
      final favouriteFoods = await HiveServices.getFromHive(boxName: 'favourite');
      final deleteFoods = await HiveServices.getFromHive(boxName: 'delete');

      // Convert the Hive data into FoodModel objects
      final List<FoodModel> favouriteFoodList = favouriteFoods
          .map((foodData) => FoodModel.fromJson(foodData))
          .toList();

      final List<FoodModel> deleteFoodList = deleteFoods
          .map((foodData) => FoodModel.fromJson(foodData))
          .toList();

      // Filter out foods that are already in the favourite or delete foods list
      final filteredFoods = foods.where((food) {
        // Check if food ID is already in the favourites or delete list
        return !favouriteFoodList.any((favourite) => favourite.id == food.id) &&
            !deleteFoodList.any((deleted) => deleted.id == food.id);
      }).toList();

      // Update state with filtered foods
      state = state.copyWith(
        foods: [...state.foods, ...filteredFoods],
        isLoading: false,
        hasMore: filteredFoods.length >= 10,
        page: state.page + 1,
      );

    } catch (_) {
      state = state.copyWith(isLoading: false, hasMore: false);
    }
  }
  void deleteFood(int index) {
    List<FoodModel> updatedFoods = List.from(state.foods);
    updatedFoods.removeAt(index); // Remove the food item at the given index
    state = state.copyWith(foods: updatedFoods); // Update the state with the new list
  }
  void foodRemoveAt(int index){
    List<FoodModel> updatedFoods = List.from(state.foods);
    debugPrint("\nupdate foods length : ${updatedFoods.length}\n");
    updatedFoods.removeAt(index);
    state = state.copyWith(foods: updatedFoods);
  }
}

final foodProviderFamily = StateNotifierProvider.family<FoodNotifier, FoodState, String?>(
      (ref, category) {
    final repo = ref.watch(foodRepositoryProvider);
    return FoodNotifier(repo, category?.isNotEmpty == true ? category : null);
  },
);

Future<void> saveToHive(FoodModel food, String boxName) async {
  await HiveServices.saveToHive(
    boxName: boxName,
    key: food.id,
    data: food.toJson(),
  );
}