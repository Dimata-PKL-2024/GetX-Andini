import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_Controller.dart';
import '../controllers/users_Controller.dart';

class AddPage extends StatelessWidget {
  final addController = Get.find<AddController>();
  final usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: Color(0xFF8D6E63), // Warna AppBar coklat gelap
        title: Text(
          "ADD USER",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              buildTextField("Full Name", addController.nameController), // Function split
              SizedBox(height: 15),
              buildTextField("Email Address", addController.emailController, keyboardType: TextInputType.emailAddress), // Function split
              SizedBox(height: 15),
              buildTextField("Phone Number", addController.phoneController, keyboardType: TextInputType.phone, onSubmitted: () {
                usersController.add(
                  addController.nameController.text,
                  addController.emailController.text,
                  addController.phoneController.text,
                );
              }), // Function split
              SizedBox(height: 30),
              AddUserButton(usersController: usersController, addController: addController), // Class split
            ],
          ),
        ),
      ),
    );
  }

  // Function split untuk membuat TextField
  Widget buildTextField(
    String labelText,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    void Function()? onSubmitted,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      onEditingComplete: onSubmitted,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xFF6D4C41)), // Warna teks label
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF8D6E63)), // Warna border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF6D4C41)), // Warna border fokus
        ),
      ),
    );
  }
}

// Class split untuk tombol Add User
class AddUserButton extends StatelessWidget {
  final UsersController usersController;
  final AddController addController;

  AddUserButton({required this.usersController, required this.addController});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF8D6E63),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () {
        usersController.add(
          addController.nameController.text,
          addController.emailController.text,
          addController.phoneController.text,
        );
      },
      child: Text(
        "ADD USER",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
