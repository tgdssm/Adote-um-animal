import 'package:pet_adoption_flutter_app/data/providers/authentication_provider.dart';
import 'package:pet_adoption_flutter_app/data/providers/user_location.dart';

final authProvider = AuthentificationPrivider().getCurrentUser();
final userCurrentLocation = UserLocation.getUserCurrentLocation();
