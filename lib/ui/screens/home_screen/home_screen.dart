import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/models/user.dart';
import 'package:pet_adoption_flutter_app/ui/screens/animal_characteristics_screen/animal_characteristics_screen.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/home_controller.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/widgets/animal_container.dart';
import 'package:pet_adoption_flutter_app/ui/screens/home_screen/widgets/app_bar_custom.dart';
import 'package:pet_adoption_flutter_app/ui/screens/register_animal_screen/register_animal_screen.dart';
import 'package:pet_adoption_flutter_app/ui/screens/user_screen/user_screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen({this.user});
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
                          future: _homeController.read(filter: animalFilter),
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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserScreen(),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
          transitionDuration: Duration(seconds: 0),
        ));
  }
}
