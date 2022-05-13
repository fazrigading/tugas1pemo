import 'package:flutter/material.dart';
import 'main.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {Key? key,
      required this.kreator,
      required this.judul,
      required this.harga,
      required this.gambar,
      required this.kreatorImg})
      : super(key: key);
  final String kreator;
  final String judul;
  final double harga;
  final String gambar;
  final String kreatorImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 70,
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 28, right: 28, bottom: 28),
            width: 358,
            height: 358,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 15,
                      color: Colors.black26)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(gambar), fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 12,
                      color: Colors.black26)
                ],
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Column(
              children: [
                Container(
                    padding:
                        const EdgeInsets.only(top: 32, left: 28, right: 28),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 16),
                              width: 86,
                              height: 86,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(kreatorImg),
                                      fit: BoxFit.cover))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(kreator,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(132, 132, 132, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              Text(judul,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(18, 18, 18, 1),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800)),
                              Text(harga.toString() + ' ETH',
                                  style: const TextStyle(
                                      color: Color.fromRGBO(18, 183, 183, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ])),
                Container(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("test"), Text("test")],
                  ),
                ),
                BeliNFT(hargabeli: harga)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BeliNFT extends StatefulWidget {
  const BeliNFT({Key? key, required this.hargabeli}) : super(key: key);
  final double hargabeli;
  @override
  // ignore: no_logic_in_create_state
  _BeliNFTState createState() => _BeliNFTState(harganft: hargabeli);
}

class _BeliNFTState extends State<BeliNFT> {
  double harganft;
  double newbalance = balance;
  _BeliNFTState({required this.harganft});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Current Balance $newbalance'),
        Container(
          padding: const EdgeInsets.only(bottom: 32, left: 28, right: 28),
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Material(
                borderRadius: BorderRadius.circular(18),
                elevation: 5,
                color: const Color.fromRGBO(18, 18, 18, 1),
                child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        newbalance = balance - harganft;
                      });
                    },
                    minWidth: 158,
                    height: 58,
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
