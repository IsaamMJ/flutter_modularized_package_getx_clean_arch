import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecase/login_usecase.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the abstract AuthRepository to its implementation
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());

    // Bind the LoginUseCase, which depends on AuthRepository
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepository>()));

    // Bind the AuthController, which depends on LoginUseCase
    Get.lazyPut(() => AuthController(Get.find<LoginUseCase>()));
  }
}
