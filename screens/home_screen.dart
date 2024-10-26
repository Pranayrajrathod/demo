import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  XFile? _selectedImage;
  LocationData? _locationData;

  // For picking image from gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  // For capturing image with camera
  Future<void> _captureImageWithCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _selectedImage = image;
    });
  }

  // For getting location
  Future<void> _getLocation() async {
    final Location location = Location();
    LocationData locationData = await location.getLocation();
    setState(() {
      _locationData = locationData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Urban Hero"),
        backgroundColor: Colors.yellowAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Action for cart icon
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.yellowAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
              ),
              child: Icon(
                Icons.ac_unit,
                size: 50,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text("H O M E"),
              onTap: () {
                Navigator.pop(context); // Close drawer on navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text("Track Your Issues"),
              onTap: () {
                Navigator.pushNamed(context, '/trackIssues');
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text("Feedback"),
              onTap: () {
                // Action for feedback
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pushNamed(context, '/settingspage');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Report Waste Issue",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                items: ['Plastic', 'Organic', 'Metal']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'Select Waste Type',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Describe the waste issue in your area',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Button to upload image from gallery
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _pickImage,
                      icon: Icon(Icons.upload_file),
                      label: Text('Upload Image'),
                    ),
                  ),
                  SizedBox(width: 10), // Space between buttons
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _captureImageWithCamera,
                      icon: Icon(Icons.camera_alt),
                      label: Text('Capture Image'),
                    ),
                  ),
                ],
              ),
              if (_selectedImage != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(_selectedImage!.path),
                    height: 100,
                  ),
                ),
              SizedBox(height: 20),
              // Button to get location
              ElevatedButton.icon(
                onPressed: _getLocation,
                icon: Icon(Icons.location_on),
                label: Text('Get Location'),
              ),
              if (_locationData != null)
                Text(
                  'Location: Lat: ${_locationData!.latitude}, Lng: ${_locationData!.longitude}',
                  style: TextStyle(fontSize: 14),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action for submit button
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
