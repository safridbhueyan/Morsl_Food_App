import 'package:dio/dio.dart';
import '../model/food_model.dart';

class FoodRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://celina0057backend.signalsmind.com/foods';

  Future<List<FoodModel>> fetchFoods({
    String? category,
    required int page,
    int limit = 20,
  }) async {
    final params = {
      'page': page,
      'limit': limit,
      if (category != null && category.isNotEmpty) 'category': category,
    };

    final response = await _dio.get(baseUrl, queryParameters: params);
    final List data = response.data['data'];
    return data.map((item) => FoodModel.fromJson(item)).toList();
  }
}
