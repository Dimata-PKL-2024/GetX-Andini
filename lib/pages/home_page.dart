import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';
import '../controllers/users_Controller.dart';

// Fungsi untuk membuat AppBar
AppBar buildAppBar() {
  return AppBar(
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
  );
}

// Fungsi untuk menampilkan pesan ketika data kosong
Widget buildEmptyState() {
  return Center(
    child: Text(
      "Belum ada data",
      style: TextStyle(
        color: Color(0xFFBDBDBD),
        fontSize: 18,
      ),
    ),
  );
}

// Fungsi untuk membuat daftar pengguna
Widget buildUserList(UsersController usersController) {
  return ListView.builder(
    itemCount: usersController.users.length,
    itemBuilder: (context, i) => UserCard(
      userId: usersController.users[i].id,
      name: usersController.users[i].name!,
      email: usersController.users[i].email!,
      onDelete: () => usersController.delete(usersController.users[i].id),
      onTap: () => Get.toNamed(
        RouteName.profile,
        arguments: usersController.users[i].id,
      ),
    ),
  );
}


// Kelas terpisah untuk menampilkan kartu pengguna
class UserCard extends StatelessWidget {
  final String userId;
  final String name;
  final String email;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const UserCard({
    required this.userId,
    required this.name,
    required this.email,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
          name,
          style: TextStyle(
            color: Color(0xFF4E342E), // Warna teks judul
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          email,
          style: TextStyle(
            color: Color(0xFF6D4C41), // Warna teks subjudul
          ),
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: Icon(
            Icons.delete_forever,
            color: Colors.red[900],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Warna latar belakang
      appBar: buildAppBar(),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(16),
            child: usersController.users.isEmpty
                ? buildEmptyState()
                : buildUserList(usersController),
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
