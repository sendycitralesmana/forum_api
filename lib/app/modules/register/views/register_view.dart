import 'package:flutter/material.dart';
import 'package:forum_api/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
              "Register Page",
              style: TextStyle(
                fontSize: size * 0.080,
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: controller.name,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
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
                controller.register(controller.email.text, controller.email.text,
                    controller.password.text,);
              },
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: size * 0.040,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Get.toNamed(Routes.LOGIN), 
              child: Text(
                "Login",
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
