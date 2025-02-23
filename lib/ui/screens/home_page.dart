import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_plant/constants.dart';
import 'package:project_plant/ui/screens/detail_page.dart';
import 'package:project_plant/ui/screens/widgets/plant_widget.dart';

import '../../models/plant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<Plant> _filteredPlantList = Plant.plantList;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _filteredPlantList = Plant.plantList
          .where((plant) => plant.plantName
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<String> _plantTypes = [
      'Đề xuất',
      'Trong nhà',
      'Ngoài trời',
      'Vườn',
      'Bổ sung',
    ];

    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tìm kiếm
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Tìm kiếm cây...',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
            // Danh mục cây trồng
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          _plantTypes[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: selectedIndex == index
                                ? Constants.primaryColor
                                : Constants.blackColor,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            // Kiểm tra kết quả tìm kiếm
            _filteredPlantList.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Cây bạn tìm kiếm không có trong danh sách.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: size.height * .3,
                    child: ListView.builder(
                        itemCount: _filteredPlantList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: DetailPage(
                                        plantId:
                                            _filteredPlantList[index].plantId,
                                      ),
                                      type: PageTransitionType.bottomToTop));
                            },
                            child: Container(
                              width: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    right: 20,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            bool isFavorited =
                                                toggleIsFavorated(
                                                    _filteredPlantList[index]
                                                        .isFavorated);
                                            _filteredPlantList[index]
                                                .isFavorated = isFavorited;
                                          });
                                        },
                                        icon: Icon(
                                          _filteredPlantList[index]
                                                      .isFavorated ==
                                                  true
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Constants.primaryColor,
                                        ),
                                        iconSize: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 50,
                                    right: 50,
                                    top: 50,
                                    bottom: 50,
                                    child: Image.asset(
                                        _filteredPlantList[index].imageURL),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _filteredPlantList[index].category,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          _filteredPlantList[index].plantName,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 20,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        '${_filteredPlantList[index].price} vnđ',
                                        style: TextStyle(
                                            color: Constants.primaryColor,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Constants.primaryColor.withOpacity(.8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        }),
                  ),
            // Cây mới
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                'Cây mới',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: _filteredPlantList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailPage(
                                      plantId:
                                          _filteredPlantList[index].plantId),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: PlantWidget(
                          index: index,
                          plantList: _filteredPlantList,
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
