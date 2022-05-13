import 'package:flutter/material.dart';
import 'button.dart';
import 'nftlist.dart';
import 'profilepage.dart';
import 'landingpage.dart';

void main() {
  runApp(const MyApp());
}

double balance = 43.19;
String firstName = "Fazri",
    lastName = "Gading",
    emailAddress = "fazrigading@gmail.com";
List<String> gender = ["Male", "Female"];
int chosenGender = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Post-test 4 2009106031',
        theme: ThemeData(
            fontFamily: 'Manrope',
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black))),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LandingPage(),
          '/mainpage': (context) => const MainPage(),
          '/profilepage': (context) => EditProfile(
              firstName: firstName,
              lastName: lastName,
              gender: gender,
              emailAddress: emailAddress,
              chosenGender: chosenGender),
        });
  }
}

/* MAIN PAGE */
class MainPage extends StatefulWidget {
  const MainPage({Key? key, firstName, lastName}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<BottomNavigationBarItem> _bottomItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  final List<Widget> _myPages = [
    ListView(
      children: const [
        SubmenuTitles(teks: 'Categories'),
        CategoriesButton(),
        SubmenuTitles(teks: 'Featured NFTs'),
        FeaturedNFT(),
        SubmenuTitles(teks: 'Featured Creators'),
        Creators(),
      ],
    ),
    const ViewProfile(),
  ];
  int _indexBottom = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(18, 18, 18, 0.9),
        elevation: 5,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(18, 18, 18, 1),
              ),
              child: Center(
                child: Text(
                  "Welcome to the\nbest of the best\nNFT Marketplace App!",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_library_rounded,
                color: Colors.white,
              ),
              title: const Text("Your NFTs",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
              ),
              title: const Text("Wallets",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: const Text("Favorites",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.category_sharp,
                color: Colors.white,
              ),
              title: const Text("Categories",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 70,
        title: const Text(
          "NFT App by Gading",
          style: TextStyle(
              fontFamily: 'Manrope',
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w800),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {},
                icon: const Icon(Icons.notifications)),
          )
        ],
      ),
      body: _myPages.elementAt(_indexBottom),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItem,
        currentIndex: _indexBottom,
        onTap: (int index) {
          setState(() {
            _indexBottom = index;
          });
        },
      ),
    );
  }
}

class SubmenuTitles extends StatelessWidget {
  const SubmenuTitles({Key? key, required this.teks}) : super(key: key);
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            teks,
            style: const TextStyle(
              color: Color.fromRGBO(18, 18, 18, 1),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text('View all'),
              style: TextButton.styleFrom(
                  primary: const Color.fromRGBO(132, 132, 132, 1)))
        ]));
  }
}
