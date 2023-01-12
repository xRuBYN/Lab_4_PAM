import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laboratorul4v3/domain/service/ArticleService.dart';

import 'controller/DetailsController.dart';
import 'controller/HomeController.dart';
import 'controller/page/DetailsPage.dart';
import 'controller/page/HomePage.dart';

class Navigation {

  static const String ROUTE_HOME = "/home";
  static const String ROUTE_DETAILS = "/details/:articleId";

  static List<GetPage<dynamic>> pages() {
    return [
      GetPage(
          name: ROUTE_HOME,
          page: () => const HomePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<HomeController>(
                    () => HomeController(articlesUseCase: Get.find<ArticlesService>())
            );
          })
      ),
      GetPage(
          name: ROUTE_DETAILS,
          page: () => const DetailsPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<DetailsController>(
                    () => DetailsController(
                    articleId: Get.parameters["articleId"],
                    articlesUseCase: Get.find<ArticlesService>()
                )
            );
          })
      )
    ];
  }

  static String toDetails(int articleId) {
    return ROUTE_DETAILS.replaceAll(":articleId", articleId.toString());
  }
}