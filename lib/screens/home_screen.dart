import 'package:flutter/material.dart';
import '../api_service.dart';
import 'detail_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway',
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 186, 183, 180),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(27, 64, 95, 1),
          title: Text('Travel Destinations'),
        ),
        body: FutureBuilder(
          future: apiService.getCountries(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final countries = snapshot.data as List<dynamic>;
              return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    title: Text(country['name']['common']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(country: country),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.home, size: 30),
            label: Text('Home', style: TextStyle(fontSize: 18)),
            backgroundColor: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            splashColor: Colors.white,
            tooltip: 'Home',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
