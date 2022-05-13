import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  int _current = 0;
  final CarouselController _carouselCtrl = CarouselController();
  final List<Widget> landingImages = [
    Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/landingpageimg.png'),
              fit: BoxFit.fitHeight)),
    ),
    Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gutterrat1780.png'),
              fit: BoxFit.fitHeight)),
    ),
    Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/azuki6905.png'),
              fit: BoxFit.fitHeight)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CarouselSlider(
            items: landingImages,
            carouselController: _carouselCtrl,
            options: CarouselOptions(
                viewportFraction: 1,
                height: 575,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                })),
        Container(
          height: 300,
          margin: const EdgeInsets.only(top: 510),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: 12,
                    color: Colors.black26)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: landingImages.asMap().entries.map((entry) {
                      return GestureDetector(
                          onTap: () => _carouselCtrl.animateToPage(entry.key),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ));
                    }).toList()),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Discover Rare\nCollectibles",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Buy and Bid Rare Collectibles from\nTop Artists.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(18, 18, 18, 0.6)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/mainpage');
                },
                child: Container(
                  height: 65,
                  width: 340,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(13, 183, 183, 1),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Center(
                    child: Text(
                      "Explore NFTs",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
