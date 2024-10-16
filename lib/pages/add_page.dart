import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/addC.dart';
import '../controllers/usersC.dart';

class AddPage extends StatelessWidget {
  final addC = Get.find<AddC>();
  final usersC = Get.find<UsersC>();

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
              TextField(
                controller: addC.nameC,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Full Name",
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
              ),
              SizedBox(height: 15),
              TextField(
                controller: addC.emailC,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autocorrect: false,
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
                controller: addC.phoneC,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                autocorrect: false,
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
                onEditingComplete: () => usersC.add(
                  addC.nameC.text,
                  addC.emailC.text,
                  addC.phoneC.text,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8D6E63), // Mengganti primary dengan backgroundColor
                  foregroundColor: Colors.white, // Mengganti onPrimary dengan foregroundColor
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () => usersC.add(
                  addC.nameC.text,
                  addC.emailC.text,
                  addC.phoneC.text,
                ),
                child: Text(
                  "ADD USER",
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
