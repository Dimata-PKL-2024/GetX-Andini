import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../controllers/users_Controller.dart';
import '../controllers/profile_Controller.dart';

class ProfilePage extends StatelessWidget {
  final profileController = Get.find<ProfileController>();
  final userController = Get.find<UsersController>();
  final String uid = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final User user = userController.userById(uid);
    profileController.nameController.text = user.name!;
    profileController.emailController.text = user.email!;
    profileController.phoneController.text = user.phone!;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              buildTextField(
                controller: profileController.nameController,
                labelText: "Full Name",
              ),
              SizedBox(height: 15),
              buildTextField(
                controller: profileController.emailController,
                labelText: "Email Address",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15),
              buildTextField(
                controller: profileController.phoneController,
                labelText: "Phone Number",
                keyboardType: TextInputType.phone,
                onEditingComplete: () => _updateUser(),
              ),
              SizedBox(height: 30),
              buildUpdateButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF6D4C41),
      title: Text(
        "PROFILE",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => userController.delete(uid).then(
            (deleted) {
              if (deleted) Get.back();
            },
          ),
          icon: Icon(Icons.delete_forever, color: Colors.red[700]),
        ),
      ],
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    void Function()? onEditingComplete,
  }) {
    return TextField(
      controller: controller,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xFF6D4C41)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF8D6E63)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF6D4C41)),
        ),
      ),
      onEditingComplete: onEditingComplete,
    );
  }

  Widget buildUpdateButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF8D6E63),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () => _updateUser(),
      child: Text(
        "UPDATE",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  void _updateUser() {
    userController.edit(
      uid,
      profileController.nameController.text,
      profileController.emailController.text,
      profileController.phoneController.text,
    );
  }
}
