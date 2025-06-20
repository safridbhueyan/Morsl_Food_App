import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morsl_app_celina0057/data/model/food_model.dart';
import '../../../../provider/food_provider.dart';

class MoodCravings extends ConsumerStatefulWidget {
  final String category;
  const MoodCravings({super.key, required this.category});

  @override
  ConsumerState<MoodCravings> createState() => _MoodCravingsState();
}

class _MoodCravingsState extends ConsumerState<MoodCravings> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        final provider = ref.read(foodProviderFamily(widget.category).notifier);
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300) {
          provider.fetchFoods();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final foodState = ref.watch(foodProviderFamily(widget.category));

    if (foodState.isLoading && foodState.foods.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 2 columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: foodState.foods.length + (foodState.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < foodState.foods.length) {
          final FoodModel food = foodState.foods[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              food.image,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
