import 'package:flutter/material.dart';
import 'package:project_plant/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        title: const Text(
          'Hồ Sơ Cá Nhân',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Profile Section
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: Constants.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Avatar
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // User Name
                  Text(
                    'Khoa lê',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Email
                  Text(
                    'khoale@gmail.com',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Options Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ProfileOption(
                    icon: Icons.person,
                    title: 'Hồ sơ cá nhân',
                    onTap: () {
                      // Handle action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.settings,
                    title: 'Cài đặt',
                    onTap: () {
                      // Handle action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.notifications,
                    title: 'Thông báo',
                    onTap: () {
                      // Handle action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.chat,
                    title: 'Hỗ trợ',
                    onTap: () {
                      // Handle action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.share,
                    title: 'Chia sẻ',
                    onTap: () {
                      // Handle action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    title: 'Đăng xuất',
                    onTap: () {
                      // Handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Constants.primaryColor,
              size: 28,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
