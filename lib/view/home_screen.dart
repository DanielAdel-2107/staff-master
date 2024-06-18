import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projflut/constants.dart';
import 'package:projflut/controller/add_property_controller.dart';
import 'package:projflut/controller/get_property_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Real Estate Assessor',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AssessorPage(),
//     );
//   }
// }

class AssessorPage extends StatefulWidget {
  @override
  _AssessorPageState createState() => _AssessorPageState();
}

class _AssessorPageState extends State<AssessorPage> {
  List<Property> properties = [
    Property(
      id: 1,
      location: 'Example Location 1',
      areaRange: '500-600 sqft',
      bedrooms: 2,
      baths: 2,
      price: 200000,
      images: [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
      ],
    ),
    Property(
      id: 2,
      location: 'Example Location 2',
      areaRange: '600-700 sqft',
      bedrooms: 3,
      baths: 2,
      price: 250000,
      images: [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
      ],
    ),
    // Add more properties as needed
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Assessor'),
        backgroundColor: primaryColor,
      ),
      body: properties.isEmpty
          ? const Center(
              child: Text('No properties to assess'),
            )
          : GetBuilder<GetPropertyController>(
              init: GetPropertyController(),
              builder: (controller) => ListView.builder(
                itemCount: controller.propertyModel.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
///////////////////////////////////////////======>>>>>>>>>>>>>>>>
                          Text(
                              'Location: ${controller.propertyModel[index].locationn}'),
                          Text(
                              'Area Range: ${controller.propertyModel[index].area}'),
                          Text(
                              'Bedrooms: ${controller.propertyModel[index].noOfRooms}'),
                          Text(
                              'Baths: ${controller.propertyModel[index].noOfBaths}'),
                          Text(
                              'Price: \$${controller.propertyModel[index].price}'),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.propertyModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Image.asset('assets/hotel_2.png'));
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.userEmail =
                                      controller.propertyModel[index].userEmail;
                                  controller.userPhone =
                                      controller.propertyModel[index].userPhone;
                                  controller.locationn =
                                      controller.propertyModel[index].locationn;
                                  controller.area =
                                      controller.propertyModel[index].area;
                                  controller.amenty =
                                      controller.propertyModel[index].amenty;
                                  controller.description = controller
                                      .propertyModel[index].description;
                                  controller.downPayment = controller
                                      .propertyModel[index].downPayment;
                                  controller.installmentValue = controller
                                      .propertyModel[index].installmentValue;
                                  controller.type =
                                      controller.propertyModel[index].type;
                                  controller.noOfRooms =
                                      controller.propertyModel[index].noOfRooms;
                                  controller.noOfBaths =
                                      controller.propertyModel[index].noOfBaths;
                                  controller.price =
                                      controller.propertyModel[index].price;
                                  controller.paymentType = controller
                                      .propertyModel[index].paymentType;
                                  controller.addProperty();
                                  setState(() {
                                    controller.propertyModel.remove(
                                        controller.propertyModel[index]);
                                  });
                                },
                                child: const Text('Approve'),
                              ),
                              const SizedBox(width: 8),
                              OutlinedButton(
                                onPressed: () {},
                                child: const Text('Reject'),
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    final List<dynamic> featureSets = [
                                      controller.propertyModel[index].noOfRooms,
                                      controller.propertyModel[index].noOfBaths,
                                      controller
                                          .propertyModel[index].sqftLiving,
                                      controller.propertyModel[index].sqftLot,
                                      controller.propertyModel[index].floors,
                                      controller
                                          .propertyModel[index].waterFront,
                                      controller.propertyModel[index].view,
                                      controller
                                          .propertyModel[index].conditions,
                                      controller.propertyModel[index].grade,
                                      controller.propertyModel[index].sqftAbov,
                                      controller.propertyModel[index].yrBuild,
                                      controller.propertyModel[index].zipcode,
                                      controller.propertyModel[index].lat,
                                      controller.propertyModel[index].long,
                                      controller
                                          .propertyModel[index].sqftLiving15,
                                      controller.propertyModel[index].sqftLot15
                                    ];
                                    print(featureSets);
                                    sendDataToApi(context, featureSets);
                                    setState(() {
                                      index = index + 1;
                                    });
                                    print(index);
                                  },
                                  child: const Text('Asses'))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future<void> sendDataToApi(
      BuildContext context, List<dynamic> featureSets) async {
    const String url = 'https://connection-my9x.onrender.com/predict';

    final Map<String, dynamic> data = {'features': featureSets};

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      _showCustomDialog(context, 'price', response.body);
    } else {
      _showCustomDialog(context, 'Error',
          'Failed to send data. Status code: ${response.statusCode}');
    }
  }

  void _showCustomDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        RegExp regExp = RegExp(r'[-+]?\d*\.?\d+');
        int num = 0;
        // Use the regular expression to find the first match
        Iterable<Match> matches = regExp.allMatches(content);

        if (matches.isNotEmpty) {
          // Get the first match
          String numberString = matches.first.group(0)!;
          // Convert the extracted string to a number (double in this case)
          double number = double.parse(numberString);

          // Print the result
          num = number.toInt();
        }
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.info, color: const Color.fromARGB(255, 164, 193, 218)),
              SizedBox(width: 10),
              Text('price'),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Price of building ' + num.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void approveProperty(Property property) {
    setState(() {
      properties.remove(property);
    });
  }

  void rejectProperty(Property property) {
    setState(() {
      properties.remove(property);
    });
  }
}

class PropertyItem extends StatelessWidget {
  final Property property;
  final VoidCallback onApproved;
  final VoidCallback onRejected;

  const PropertyItem({
    required this.property,
    required this.onApproved,
    required this.onRejected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${property.location}'),
            Text('Area Range: ${property.areaRange}'),
            Text('Bedrooms: ${property.bedrooms}'),
            Text('Baths: ${property.baths}'),
            Text('Price: \$${property.price.toString()}'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: property.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.network(
                      property.images[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onApproved,
                  child: const Text('Approve'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: onRejected,
                  child: const Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Property {
  final int id;
  final String location;
  final String areaRange;
  final int bedrooms;
  final int baths;
  final int price;
  final List<String> images;

  Property({
    required this.id,
    required this.location,
    required this.areaRange,
    required this.bedrooms,
    required this.baths,
    required this.price,
    required this.images,
  });
}
