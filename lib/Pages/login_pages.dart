import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pas/Components/formlabel.dart';
import 'package:project_pas/Components/mytextfield.dart';
import 'package:project_pas/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.put(LoginController());
  bool passwordObscured = true;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Login')),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.lock_person_outlined,
                  size: 64,
                  color: Color(0xFF087E72),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Masuk ke Project PAS',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Akun latihan: admin123 / admin123',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF667873), fontSize: 12),
                ),
                const SizedBox(height: 26),
                const FormLabel(label: 'Username'),
                CustomTextfield(
                  txtController: controller.txtUsername,
                  hint: 'Masukkan username',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                const FormLabel(label: 'Password'),
                TextField(
                  controller: controller.txtPassword,
                  obscureText: passwordObscured,
                  decoration: InputDecoration(
                    hintText: 'Masukkan password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => setState(
                        () => passwordObscured = !passwordObscured,
                      ),
                      icon: Icon(
                        passwordObscured
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Obx(
                  () => SizedBox(
                    height: 48,
                    child: FilledButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.login,
                      child: controller.isLoading.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Login'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
