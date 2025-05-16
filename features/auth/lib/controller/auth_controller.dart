import 'package:get/get.dart';
import 'package:core/routes/app_routes.dart';

import '../domain/entities/user.dart';
import '../domain/usecase/login_usecase.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;

  AuthController(this.loginUseCase);

  var user = Rxn<User>();
  var loading = false.obs;

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  Future<void> login(String email, String password) async {
    if (!_isValidEmail(email)) {
      Get.snackbar('Invalid Email', 'Please enter a valid email address');
      return;
    }

    loading.value = true;
    final result = await loginUseCase.execute(email, password);
    user.value = result;
    loading.value = false;

    if (user.value != null) {
      Get.snackbar('Success', 'Welcome ${user.value!.email}');
      Get.offAllNamed(AppRoutes.main); // ✅ this will now work
    } else {
      Get.snackbar('Error', 'Invalid email or password');
    }
  }
}
