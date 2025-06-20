import 'package:go_router/go_router.dart';
import 'package:morsl_app_celina0057/data/routes/route_const.dart';
import 'package:morsl_app_celina0057/src/feature/Parents_screen/view/parents_screen.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/view/favorite_screen.dart';
import 'package:morsl_app_celina0057/src/feature/home_screen/home_screen.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/view/terms&condition.dart';
import 'package:morsl_app_celina0057/src/feature/splash_screen/splash_screen.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.initialRoute,
    routes: [
      GoRoute(
        name: RouteName.initialRoute,
        path: RouteName.initialRoute,
        builder: (context, state) => const SplashScreen(),
      ),
   
       GoRoute(
        name: RouteName.policyScreen,
        path: RouteName.policyScreen,
        builder: (context, state) => const PrivacyPolicy(),
      ),
      GoRoute(

        name: RouteName.favorite,
        path: RouteName.favorite,
        builder: (context, state) => const FavoriteScreen(),
      ),
      GoRoute(
        name: RouteName.parentScreen,
        path: RouteName.parentScreen,
        builder: (context, state) => const ParentScreen(),
      ),
     GoRoute(
         name: RouteName.homeScreen,
        path: RouteName.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      
      


      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) =>
      //       BottomBarWidget(navigationShell: navigationShell),
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.home,
      //           builder: (context, state) => const Home(),
      //         ),
      //       ],
      //     ),

      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.favorite,
      //           builder: (context, state) => const FavoriteScreen(),
      //         ),
      //       ],
      //     ),

      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.reset,
      //           builder: (context, state) => const Reset(),
      //         ),
      //       ],
      //     ),

      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteName.settings,
      //           builder: (context, state) => const Settings(),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

    ],
  );
}
