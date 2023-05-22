import 'package:flutter/cupertino.dart';
import 'package:my_flutter/src/models/venue_model.dart';

class VenueDetailsPage extends StatefulWidget {
  final VenueModel venue;
  const VenueDetailsPage({super.key, required this.venue});
  @override
  _VenueDetailsPageState createState() => _VenueDetailsPageState();
}

class _VenueDetailsPageState extends State<VenueDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}