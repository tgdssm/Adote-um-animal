import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/models/user.dart';
import 'package:pet_adoption_flutter_app/ui/commons/bottom_navigation_bar.dart';
import 'package:pet_adoption_flutter_app/ui/screens/animal_characteristics_screen/animal_characteristics_screen.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/home_controller.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/widgets/animal_container.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/widgets/app_bar_custom.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/register_animal_screen.dart';
import 'package:pet_adoption_flutter_app/ui/screens/user_screen/user_screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  final String userCurrentLocation;
  HomeScreen({this.user, this.userCurrentLocation});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = HomeController();
  String animalFilter;

  void filter(String animalFilter) {
    setState(() {
      this.animalFilter = animalFilter;
    });
    print('filter function ${this.animalFilter}');
  }

  void signOut() {
    _homeController.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarCustom(user: widget.user, voidCallback: signOut),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimalContainer(
                    animal: 'DOG',
                    filter: filter,
                  ),
                  AnimalContainer(
                    animal: 'CAT',
                    filter: filter,
                  ),
                  AnimalContainer(
                    animal: 'ALL',
                    filter: filter,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: FutureBuilder(
                          future: _homeController.read(filter: animalFilter, city: widget.userCurrentLocation),
                          builder:
                              (context, AsyncSnapshot<List<Animal>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting)
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            if (snapshot.data.length <= 0)
                              return Center(
                                child: Text('NENHUM ANIMAL CADASTRADO'),
                              );
                            return Swiper(
                              itemCount: snapshot.data.length,
                              layout: SwiperLayout.STACK,
                              itemWidth: MediaQuery.of(context).size.width,
                              itemHeight: MediaQuery.of(context).size.height,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AnimalCharacteristics(
                                          animal: snapshot.data[index],
                                        ),
                                      )),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              child: Image.network(
                                                snapshot.data[index].urlPhoto,
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
                                                      fontSize: 26),
                                                ),
                                                Text(
                                                  snapshot.data[index].breed,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
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
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        screen2: RegisterAnimalScreen(city: widget.userCurrentLocation),
        screen3: UserScreen(position: widget.userCurrentLocation),
      ),
    );
  }
}
