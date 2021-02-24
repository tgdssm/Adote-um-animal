import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/home_controller.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/widgets/animal_container.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/widgets/app_bar_custom.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/register_animal_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = HomeController();
  List<String> images = [
    'assets/images/Aatrox_0.jpg',
    'assets/images/Aatrox_1.jpg',
    'assets/images/Aatrox_2.jpg',
    'assets/images/Aatrox_3.jpg',
    'assets/images/Aatrox_7.jpg',
    'assets/images/Aatrox_8.jpg',
    'assets/images/Aatrox_9.jpg',
    'assets/images/Aatrox_11.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarCustom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimalContainer(
                    animal: 'dog',
                  ),
                  AnimalContainer(
                    animal: 'cat',
                  ),
                  AnimalContainer(
                    animal: 'bird',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: [
                    // Text(
                    //   '${images.length} animais encontrados',
                    //   style: TextStyle(
                    //       color: Colors.black, fontWeight: FontWeight.w600, fontSize: 23.0),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: FutureBuilder(
                          future: _homeController.read(),
                          builder:
                              (context, AsyncSnapshot<List<Animal>> snapshot) {
                            if (snapshot.hasData)
                              return Swiper(
                                itemCount: snapshot.data.length,
                                layout: SwiperLayout.STACK,
                                itemWidth: MediaQuery.of(context).size.width,
                                itemHeight: MediaQuery.of(context).size.height,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () =>
                                        print(snapshot.data[index].photo),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context).size.width * 0.9,
                                                height: MediaQuery.of(context).size.height * 0.5,
                                                child: Image.network(
                                              snapshot.data[index].photo,
                                              fit: BoxFit.cover,
                                            )),
                                            Positioned(
                                              bottom: 15,
                                              left: 25,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    snapshot.data[index].name,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                      fontSize: 26
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data[index].breed,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                      fontSize: 20
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Icon(
                Icons.home_filled,
                size: 35,
              ),
              onTap: () => print('tocando'),
            ),
            GestureDetector(
              child: ImageIcon(
                AssetImage('assets/icons/add.png'),
                size: 45,
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterAnimalScreen())),
            ),
            GestureDetector(
              child: ImageIcon(
                AssetImage('assets/icons/person.png'),
                size: 45,
              ),
              onTap: () => print('tocando'),
            )
          ],
        ),
      ),
    );
  }
}
