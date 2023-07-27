part of 'pages.dart';

class Tracking extends StatefulWidget {
  final double location;
  final double location2;

  const Tracking({Key key, this.location, this.location2}) : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(-6.200000, 106.816666);
  static const LatLng destination = LatLng(-6.117664, 106.906349);

  List<LatLng> polylineCoordinates = [];
  LocationData currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    // currentLocation = await location.getLocation();

    // setState(() {});
    location.getLocation().then((location) {
      currentLocation = location;
      setState(() {});
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation != null
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation.latitude, currentLocation.longitude),
                  zoom: 14.5),
              polylines: {
                Polyline(
                    polylineId: PolylineId('polyline'),
                    color: Colors.red,
                    width: 6,
                    points: polylineCoordinates)
              },
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: LatLng(
                      currentLocation.latitude, currentLocation.longitude),
                ),
                // const Marker(
                //   markerId: MarkerId('source'),
                //   position: sourceLocation,
                // ),
                const Marker(
                  markerId: MarkerId('destination'),
                  position: destination,
                )
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
