import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const CarouselSliderApp());
}

class CarouselSliderApp extends StatelessWidget {
  const CarouselSliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel Slider Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CarouselSliderPage(),
    );
  }
}

class CarouselSliderPage extends StatefulWidget {
  const CarouselSliderPage({super.key});

  @override
  _CarouselSliderPageState createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends State<CarouselSliderPage> {
  final List<String> imageList = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Slider Example'),
      ),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: imageList.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              imageUrl,
                            )));
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          const Text(
            'www.flutterforgeeks.com',
            style: TextStyle(
                color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
