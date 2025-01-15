import 'package:intl/intl.dart';

class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  // Thêm phương thức để format giá
  String get formattedPrice {
    final currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );
    return currencyFormat.format(price);
  }

  Plant({
    required this.plantId,
    required this.price,
    required this.category,
    required this.plantName,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.imageURL,
    required this.isFavorated,
    required this.decription,
    required this.isSelected,
  });

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 500000,
        category: 'Trong nhà',
        plantName: 'Lan Hồ Điệp Trắng',
        size: 'Nhỏ',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/hoa_ho_diep_trang.png',
        isFavorated: true,
        decription:
            'Lan Hồ Điệp Trắng là một trong những loài hoa lan được yêu thích nhất. ',
        isSelected: false),
    Plant(
        plantId: 1,
        price: 450000,
        category: 'Ngoài trời',
        plantName: 'Lan Dendro Tím',
        size: 'Trung bình',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/dendro_tim.png',
        isFavorated: false,
        decription: 'Lan Dendro Tím là một loài hoa lan với màu tím quyến rũ. ',
        isSelected: false),
    Plant(
        plantId: 2,
        price: 600000,
        category: 'Trong nhà',
        plantName: 'Lan Vũ Nữ',
        size: 'Lớn',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/lan_vunu.png',
        isFavorated: false,
        decription:
            'Lan Vũ Nữ với vẻ đẹp kiều diễm như những vũ công đang múa. ',
        isSelected: false),
    Plant(
        plantId: 3,
        price: 750000,
        category: 'Ngoài trời',
        plantName: 'Lan Cattleya Vàng',
        size: 'Nhỏ',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/lan_catvang.png',
        isFavorated: false,
        decription:
            'Lan Cattleya Vàng được mệnh danh là nữ hoàng của các loài hoa lan. ',
        isSelected: false),
    Plant(
        plantId: 4,
        price: 800000,
        category: 'Đề xuất',
        plantName: 'Lan Phi Điệp Tím',
        size: 'Lớn',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/lan_phi_diep.png',
        isFavorated: true,
        decription:
            'Lan Phi Điệp Tím là một trong những giống lan đột biến quý hiếm. ',
        isSelected: false),
    Plant(
        plantId: 5,
        price: 550000,
        category: 'Ngoài trời',
        plantName: 'Lan Ngọc Điểm',
        size: 'Trung bình',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/lan_ngodiem.png',
        isFavorated: false,
        decription: 'Lan Ngọc Điểm với những chấm bi đặc trưng trên cánh hoa. '
            'Loài hoa này có sức sống mạnh mẽ, dễ chăm sóc và cho hoa quanh năm.',
        isSelected: false),
    Plant(
        plantId: 6,
        price: 680000,
        category: 'Vườn',
        plantName: 'Lan Mokara',
        size: 'Nhỏ',
        rating: 4.2,
        humidity: 46,
        temperature: '23 - 26',
        imageURL: 'assets/images/lan_mokara.png',
        isFavorated: false,
        decription: 'Lan Mokara là giống lai tạo có màu sắc rực rỡ. ',
        isSelected: false),
    Plant(
        plantId: 7,
        price: 900000,
        category: 'Vườn',
        plantName: 'Lan Đai Châu',
        size: 'Trung bình',
        rating: 4.5,
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/images/lan_daichau.png',
        isFavorated: false,
        decription: 'Lan Đai Châu với hương thơm đặc trưng và bền hoa. ',
        isSelected: false),
    Plant(
        plantId: 8,
        price: 1200000,
        category: 'Đề xuất',
        plantName: 'Lan Hài',
        size: 'Trung bình',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/lan_hai.png',
        isFavorated: false,
        decription:
            'Lan Hài là một trong những loài lan đặc biệt với hình dáng độc đáo như chiếc hài. ',
        isSelected: false),
  ];

  // Lấy danh sách các cây yêu thích
  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  // Lấy danh sách các cây trong giỏ hàng
  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }

  // Tính tổng giá trị giỏ hàng
  static String getCartTotal() {
    List<Plant> cartPlants = addedToCartPlants();
    int total = 0;
    for (var plant in cartPlants) {
      total += plant.price;
    }

    final currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
      decimalDigits: 0,
    );
    return currencyFormat.format(total);
  }
}
