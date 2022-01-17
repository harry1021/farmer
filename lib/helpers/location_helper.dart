// const GOOGLE_API_KEY = 'AIzaSyABTBvHgxe7efzuCpPiLnnZhCwZ78eI8Bc';
const GOOGLE_API_KEY = 'AIzaSyD5oQG50PNanpcLlfMP6_kw8MVw5OqTUY4';

class LocationHelper{
  static String generateLocationPreviewImage({required double latitude, required double longitude,}) {
    //return 'https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyAdgmnFCps7cpP5znQyen9IVbAcphmjr7w';
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}