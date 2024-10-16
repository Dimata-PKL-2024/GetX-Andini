import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../controllers/usersC.dart';
import '../controllers/profileC.dart';

class ProfilePage extends StatelessWidget {
  final profileC = Get.find<ProfileC>();
  final userC = Get.find<UsersC>();
  final String uid = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final User user = userC.userById(uid);
    profileC.nameC.text = user.name!;
    profileC.emailC.text = user.email!;
    profileC.phoneC.text = user.phone!;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: Color(0xFF6D4C41), // Warna AppBar coklat
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
            onPressed: () => userC.delete(uid).then(
              (deleted) {
                if (deleted) Get.back();
              },
            ),
            icon: Icon(Icons.delete_forever, color: Colors.red[700]),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: profileC.nameC,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Full Name",
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
              ),
              SizedBox(height: 15),
              TextField(
                controller: profileC.emailC,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Email Address",
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
              ),
              SizedBox(height: 15),
              TextField(
                controller: profileC.phoneC,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
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
                onEditingComplete: () => userC.edit(
                  uid,
                  profileC.nameC.text,
                  profileC.emailC.text,
                  profileC.phoneC.text,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8D6E63), // Menggunakan backgroundColor
                  foregroundColor: Colors.white, // Menggunakan foregroundColor
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () => userC.edit(
                  uid,
                  profileC.nameC.text,
                  profileC.emailC.text,
                  profileC.phoneC.text,
                ),
                child: Text(
                  "UPDATE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
