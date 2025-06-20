import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  /// Initialize Hive. Call this method from the main method
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  /// Save to Hive securely (data will be auto-encrypted)
  static Future<void> saveToHive({
    required String boxName, // Accept boxName as parameter
    required String key, // Dynamic key for each food item
    required Map<String, dynamic> data,
  }) async {
    try {
      final box = await Hive.openBox(boxName); // Open the box dynamically
      final jsonString = jsonEncode(data);
      await box.put(key, jsonString);
    } catch (e) {
      throw Exception(
        '\nFailed to save data in hive box. Please ensure you pass the data as Map<String, dynamic>.\nError: $e\n',
      );
    }
  }

  /// Get all data from Hive
  static Future<List<Map<String, dynamic>>> getFromHive({
    required String boxName,
  }) async {
    try {
      var box = await Hive.openBox(boxName);

      List<Map<String, dynamic>> foodList = [];

      box.toMap().forEach((key, value) {
        debugPrint('Key: $key, Value: ${value.toString()}');

        if (value is String) {
          try {
            var decodedValue = jsonDecode(value);
            if (decodedValue is Map<String, dynamic>) {
              foodList.add(decodedValue);
            } else {
              debugPrint(
                'Decoded value is not a valid Map for key $key: $decodedValue',
              );
            }
          } catch (e) {
            debugPrint('Error decoding JSON for key $key: $value');
          }
        } else if (value is Map<String, dynamic>) {
          foodList.add(value);
        } else {
          debugPrint('Invalid value format for key $key: $value');
        }
      });

      print('FoodList $boxName: ${foodList}');
      return foodList; // Return the list of maps
    } catch (e) {
      throw Exception('\nFailed to get data from hive box: $e\n');
    }
  }

  /// Clear all data from the Hive box
  static Future<void> clearAllData({
    required String boxName, // Accept boxName as parameter
  }) async {
    try {
      final box = await Hive.openBox(boxName); // Open the box dynamically
      await box.clear();
    } catch (e) {
      throw Exception('\nFailed to clear data in hive box: $e\n');
    }
  }

  static Future<void> selectedFoodClear({
    required String boxName,
    required List<String> ids,  // List of food IDs to delete
  }) async {
    try {
      final box = await Hive.openBox(boxName); // Open the box dynamically

      for (String id in ids) {
        final foodExists = await box.containsKey(id); // Check if the food exists in the box
        if (foodExists) {
          await box.delete(id); // Delete the food with the matching ID (key)
          debugPrint('Deleted food with ID: $id');
        } else {
          debugPrint('No food found with ID: $id');
        }
      }
    } catch (e) {
      throw Exception('Failed to delete foods with IDs $ids: $e');
    }
  }


/// Close the box when done (optional)
  static Future<void> close({
    required String boxName, // Accept boxName as parameter
  }) async {
    final box = await Hive.openBox(boxName); // Open the box dynamically
    await box.close();
  }
}
