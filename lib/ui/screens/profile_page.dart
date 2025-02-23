import 'package:flutter/material.dart';
import 'package:project_plant/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: Constants.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Ảnh nền mờ
                  Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                  ),
                  // Lớp phủ gradient
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Constants.primaryColor.withOpacity(0.7),
                          Constants.primaryColor.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                  // Thông tin profile ở giữa AppBar
                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Khoa Lê',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'khoale@gmail.com',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings_outlined, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                // Stats Section
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStat('Đơn Hàng', '12'),
                      _buildStatDivider(),
                      _buildStat('Cây Đã Mua', '28'),
                      _buildStatDivider(),
                      _buildStat('Yêu Thích', '15'),
                    ],
                  ),
                ),

                // Menu Options
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildSection(
                        'Quản Lý Tài Khoản',
                        [
                          _buildMenuItem(
                            icon: Icons.shopping_bag_outlined,
                            title: 'Đơn hàng của tôi',
                            subtitle: 'Xem lịch sử mua hàng',
                          ),
                          _buildMenuItem(
                            icon: Icons.favorite_border,
                            title: 'Cây yêu thích',
                            subtitle: 'Danh sách cây bạn đã lưu',
                          ),
                          _buildMenuItem(
                            icon: Icons.location_on_outlined,
                            title: 'Địa chỉ giao hàng',
                            subtitle: 'Quản lý địa chỉ nhận hàng',
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      _buildSection(
                        'Hỗ Trợ & Cài Đặt',
                        [
                          _buildMenuItem(
                            icon: Icons.support_agent_outlined,
                            title: 'Trung tâm hỗ trợ',
                            subtitle: 'Liên hệ với chúng tôi',
                          ),
                          _buildMenuItem(
                            icon: Icons.article_outlined,
                            title: 'Hướng dẫn chăm sóc cây',
                            subtitle: 'Kiến thức về cây cảnh',
                          ),
                          _buildMenuItem(
                            icon: Icons.settings_outlined,
                            title: 'Cài đặt tài khoản',
                            subtitle: 'Bảo mật & Quyền riêng tư',
                          ),
                        ],
                      ),

                      // Logout Button
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            _logout(context); // Handle logout
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.red[50],
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 10),
                              Text(
                                'Đăng Xuất',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Xử lý chức năng đăng xuất
  void _logout(BuildContext context) {
    // Chúng ta có thể sử dụng Navigator để chuyển hướng về màn hình đăng nhập
    // Ví dụ, nếu bạn có màn hình đăng nhập, bạn sẽ chuyển hướng đến màn hình đó
    Navigator.pushReplacementNamed(
        context, '/login'); // Đảm bảo rằng bạn đã cấu hình đúng route '/login'
  }

  Widget _buildStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Constants.primaryColor,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Constants.blackColor,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Constants.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Constants.primaryColor,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {},
      ),
    );
  }
}
