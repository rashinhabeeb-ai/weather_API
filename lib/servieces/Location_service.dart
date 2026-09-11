import 'dart:ui_web';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart' ;
import 'package:geolocator/geolocator.dart';

class LocationService {
  // final Geocoding _geocoding = Geocoding();
  final Geocoding? _geocoding = kIsWeb ? null : Geocoding();

  Future<Placemark?> getLocationName (Position? position)async{

    if (kIsWeb || _geocoding == null || position == null) {
      return null;
    }

    if(position != null){
      try{
        final placemarks = await _geocoding.placemarkFromCoordinates(
          position.latitude, position.longitude
        );

        if(placemarks.isNotEmpty){
          return placemarks[0];
        }

      }catch(e){
        print('Error in fetching');
      }
      return null;

    }
    return null;


  }
}