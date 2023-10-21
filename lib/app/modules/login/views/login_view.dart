import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forum_api/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Page",
              style: TextStyle(
                fontSize: size * 0.080,
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: controller.email,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => TextField(
                controller: controller.password,
                obscureText: controller.hidden.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidden.toggle(),
                    icon: controller.hidden.isTrue
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.remove_red_eye_outlined),
                  ),
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 20
                )
              ),
              onPressed: () {
                controller.login(email:controller.email.text,
                    password:controller.password.text,);
              },
              child: Obx(() => controller.isLoading.value
                  ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                  : Text(
                      "Login",
                      style: TextStyle(
                        fontSize: size * 0.040,
                      ),
                    )),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER), 
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size * 0.040,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}