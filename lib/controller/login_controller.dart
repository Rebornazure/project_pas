import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_pas/Models/login_model.dart';
import 'package:project_pas/routes.dart';

class LoginController extends GetxController {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final isLoading = false.obs;
  final loginModel = Rxn<LoginModel>();

  Future<void> login() async {
    if (txtUsername.text.trim().isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar('Login gagal', 'Username dan password harus diisi.');
      return;
    }

    isLoading.value = true;
    try {
      final response = await http
          .post(
            Uri.parse('https://mediadwi.com/api/latihan/login'),
            body: {
              'username': txtUsername.text.trim(),
              'password': txtPassword.text,
            },
          )
          .timeout(const Duration(seconds: 20));

      if (response.statusCode != 200) {
        Get.snackbar(
          'Login gagal',
          'Server mengembalikan HTTP ${response.statusCode}.',
        );
        return;
      }

      final hasil = loginModelFromJson(response.body);
      loginModel.value = hasil;
      if (hasil.status) {
        await Get.offAllNamed(Routes.home);
      } else {
        Get.snackbar('Login gagal', hasil.message);
      }
    } catch (error) {
      Get.snackbar('Login gagal', 'Tidak dapat menghubungi server: $error');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}
