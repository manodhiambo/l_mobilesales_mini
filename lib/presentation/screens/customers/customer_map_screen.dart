import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'customer_model.dart';

class CustomerMapScreen extends StatelessWidget {
  const CustomerMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customers = ModalRoute.of(context)!.settings.arguments as List<Customer>;

    final markers = customers.map((customer) {
      return Marker(
        markerId: MarkerId(customer.id),
        position: LatLng(customer.latitude, customer.longitude),
        infoWindow: InfoWindow(
          title: customer.name,
          snippet: customer.region,
        ),
      );
    }).toSet();

    return Scaffold(
      appBar: AppBar(title: const Text('Customer Map')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(customers.first.latitude, customers.first.longitude),
          zoom: 10,
        ),
        markers: markers,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}
