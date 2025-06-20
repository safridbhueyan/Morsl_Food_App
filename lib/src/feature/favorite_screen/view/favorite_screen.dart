import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morsl_app_celina0057/core/constant/icons.dart';

import '../../../../data/services/hive_box_services.dart';
import '../Riverpod/checkbox_provider.dart';
import '../widgets/checkBox/customCheckBox.dart';
import '../widgets/checkBox/customgridcheckbox.dart';
import '../widgets/delete_button.dart';
import '../widgets/glassBox.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(checkHiveProvider.notifier).initializeFromHive());
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final checkState = ref.watch(checkHiveProvider);
    final checkNotifier = ref.read(checkHiveProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: checkState.isEmpty
            ? Center(child: SvgPicture.asset(AppIcons.noFav))
            : Column(
                children: [
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Text(
                        "Your Favorites",
                        style: style.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff4B4B4B),
                        ),
                      ),
                      Spacer(),
                      if (checkState.any((e) => e.isSelected == true))
                        Row(
                          children: [
                            CustomCheckbox(
                              isSelected: checkState.every((e) => e.isSelected == true),
                              onTap: () {
                                final shouldSelectAll =
                                    !checkState.every((e) => e.isSelected == true);
                                checkNotifier.toggleSelectAll(shouldSelectAll);
                              },
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Select All",
                              style: style.bodyMedium!.copyWith(color: Color(0xff4B4B4B)),
                            ),
                            SizedBox(width: 24.w),
                            DeleteButton(
                              onTap: () async {
                                await checkNotifier.deleteSelected();
                              },
                            ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            CustomCheckbox(
                              isSelected: false,
                              onTap: () {
                                checkNotifier.toggleSelectAll(true);
                              },
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Select All",
                              style: style.bodyMedium!.copyWith(color: Color(0xff4B4B4B)),
                            ),
                          ],
                        ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: checkState.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 15.h,
                        childAspectRatio: 2 / 3,
                      ),
                      itemBuilder: (context, index) {
                        final food = checkState[index];

                        return GestureDetector(
                          onTap: () => checkNotifier.toggleSelection(index),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24.r),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.network(
                                    food.food!.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (food.isSelected == true)
                                  Positioned(
                                    top: 13.h,
                                    right: 13.w,
                                    child: CustomGridCheckbox(
                                      isSelected: food.isSelected ?? false,
                                      onTap: () => checkNotifier.toggleSelection(index),
                                    ),
                                  ),
                                Positioned(
                                  bottom: -3,
                                  left: 0,
                                  right: 0,
                                  child: Glassbox(text: food.food!.name),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:morsl_app_celina0057/core/constant/icons.dart';

// import '../../../../data/services/hive_box_services.dart';
// import '../Riverpod/checkbox_provider.dart';
// import '../widgets/checkBox/customCheckBox.dart';
// import '../widgets/checkBox/customgridcheckbox.dart';
// import '../widgets/delete_button.dart';
// import '../widgets/glassBox.dart';

// /// NEW Riverpod provider to fetch Hive favorites reactively
// final favoritesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
//   return await HiveServices.getFromHive(boxName: 'favourite');
// });

// class FavoriteScreen extends ConsumerWidget {
//   const FavoriteScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final style = Theme.of(context).textTheme;
//     final favoritesAsync = ref.watch(favoritesProvider);

//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(left: 24.w, right: 24.w),
//         child: favoritesAsync.when(
//           loading: () => Center(child: CircularProgressIndicator()),
//           error: (error, _) => Center(child: Text("Error loading data: $error")),
//           data: (foodList) {
//             if (foodList.isEmpty) {
//               return Center(child: SvgPicture.asset(AppIcons.noFav));
//             }

//             final checkState = ref.watch(checkProvider);
//             final checkNotifier = ref.read(checkProvider.notifier);

//             return Column(
//               children: [
//                 SizedBox(height: 50.h),
//                 Row(
//                   children: [
//                     Text(
//                       "Your Favorites",
//                       style: style.headlineSmall!.copyWith(
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff4B4B4B),
//                       ),
//                     ),
//                     Spacer(),
//                     if (!checkState.isSelected)
//                       Row(
//                         children: [
//                           CustomCheckbox(
//                             isSelected: checkState.isSelected,
//                             onTap: () {
//                               checkNotifier.toggleSelectionMode();
//                             },
//                           ),
//                           SizedBox(width: 6.w),
//                           Text(
//                             "Select",
//                             style: style.bodyMedium!.copyWith(
//                               color: Color(0xff4B4B4B),
//                             ),
//                           ),
//                         ],
//                       ),
//                     if (checkState.isSelected)
//                       Row(
//                         children: [
//                           CustomCheckbox(
//                             isSelected: checkState.isAllSelected,
//                             onTap: () {
//                               checkNotifier.toggleAll();
//                             },
//                           ),
//                           SizedBox(width: 6.w),
//                           Text(
//                             "Select All",
//                             style: style.bodyMedium!.copyWith(
//                               color: Color(0xff4B4B4B),
//                             ),
//                           ),
//                           SizedBox(width: 24.w),
//                           DeleteButton(
//                             onTap: () async {
//                               final selectedFoods = await checkNotifier.selectedList();
//                               final idsToDelete = selectedFoods.map((e) => e['id'].toString()).toList();

//                               await HiveServices.selectedFoodClear(
//                                 boxName: 'favourite',
//                                 ids: idsToDelete,
//                               );

//                               ///  Refresh the list after deletion
//                               ref.invalidate(favoritesProvider);

//                               /// Optional: Exit selection mode
//                               checkNotifier.toggleSelectionMode();
//                             },
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     itemCount: foodList.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 16.w,
//                       mainAxisSpacing: 15.h,
//                       childAspectRatio: 2 / 3,
//                     ),
//                     itemBuilder: (context, index) {
//                       final food = foodList[index];

//                       return GestureDetector(
//                         onTap: () {
//                           checkNotifier.toggleItem(index);
//                         },
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(24.r),
//                           child: Stack(
//                             children: [
//                               Positioned.fill(
//                                 child: Image.network(
//                                   food['image'],
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               if (checkState.isSelected)
//                                 Positioned(
//                                   top: 13.h,
//                                   right: 13.w,
//                                   child: CustomGridCheckbox(
//                                     isSelected: checkState.selectedItems[index],
//                                     onTap: () {
//                                       checkNotifier.toggleItem(index);
//                                     },
//                                   ),
//                                 ),
//                               Positioned(
//                                 bottom: -3,
//                                 left: 0,
//                                 right: 0,
//                                 child: Glassbox(text: food['name']),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
