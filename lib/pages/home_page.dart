import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';
import '../controllers/usersC.dart';

class HomePage extends StatelessWidget {
  final usersC = Get.find<UsersC>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: Color(0xFF8D6E63), // Warna AppBar coklat gelap
        title: Text(
          "ALL USERS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(RouteName.add),
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
        ],
        elevation: 0, // Menghilangkan bayangan
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(16),
            child: usersC.users.isEmpty
                ? Center(
                    child: Text(
                      "Belum ada data",
                      style: TextStyle(
                        color: Color(0xFFBDBDBD),
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: usersC.users.length,
                    itemBuilder: (context, i) => Card(
                      color: Color(0xFFEFEBE9), // Warna latar belakang kartu
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFBCAAA4), // Warna avatar
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "${usersC.users[i].name}",
                          style: TextStyle(
                            color: Color(0xFF4E342E), // Warna teks judul
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${usersC.users[i].email}",
                          style: TextStyle(
                            color: Color(0xFF6D4C41), // Warna teks subjudul
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => usersC.delete(usersC.users[i].id),
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red[900],
                          ),
                        ),
                        onTap: () => Get.toNamed(
                          RouteName.profile,
                          arguments: usersC.users[i].id,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF8D6E63), // Warna FAB coklat gelap
        onPressed: () {},
        child: Icon(
          Icons.get_app_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
