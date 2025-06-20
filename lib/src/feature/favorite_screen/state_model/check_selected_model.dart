import 'package:morsl_app_celina0057/data/model/food_model.dart';

class CheckSelectedModel {
  
  bool? isSelected;
  FoodModel? food;
CheckSelectedModel({
   this.food,
 this.isSelected
});
CheckSelectedModel copyWith({
  bool? isSelected,
  FoodModel? food,
}){
  return CheckSelectedModel(
    isSelected: isSelected ??  this.isSelected,
    food: food ?? this.food
  );
}
}