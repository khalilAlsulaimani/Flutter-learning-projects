import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
int _markerIdCounter = 0;
Completer<GoogleMapController> _mapController = Completer();

Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
child: GoogleMap(
markers: Set<Marker>.of(_markers.values),
onMapCreated: _onMapCreated,
initialCameraPosition: CameraPosition(
target: Constants.LOCATION_SRI_LANKA,
zoom: 12.0,
),
myLocationEnabled: true,
onCameraMove: (CameraPosition position) {
if(_markers.length > 0) {
MarkerId markerId = MarkerId(_markerIdVal());
Marker marker = _markers[markerId];
Marker updatedMarker = marker.copyWith(
positionParam: position.target,
)

setState(() {
_markers[markerId] = updatedMarker;
});
}
},
),
)

void _onMapCreated(GoogleMapController controller) async {
  _mapController.complete(controller);
  if ([INITIAL_LOCATION] != null) {
    MarkerId markerId = MarkerId(_markerIdVal());
    LatLng position = [INITIAL_LOCATION];
    Marker marker = Marker(
      markerId: markerId,
      position: position,
      draggable: false,
    );
    setState(() {
      _markers[markerId] = marker;
    });

    Future.delayed(Duration(seconds: 1), () async {
      GoogleMapController controller = await _mapController.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: position,
            zoom: 17.0,
          ),
        ),
      );
    });
  }
}

String _markerIdVal({bool increment = false}) {
  String val = 'marker_id_$_markerIdCounter';
  if (increment) _markerIdCounter++;
  return val;
}