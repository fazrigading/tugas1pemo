import 'package:flutter/material.dart';
import 'detailspage.dart';

class NonSelectedButton extends StatelessWidget {
  const NonSelectedButton({Key? key, required this.teks}) : super(key: key);
  final String teks;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(teks),
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          primary: Colors.black,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(
              fontFamily: 'Manrope',
              fontSize: 14,
              fontWeight: FontWeight.w600)),
    );
  }
}

class CategoriesButton extends StatelessWidget {
  const CategoriesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlinedButton(
            child: const Text('Art'),
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                primary: Colors.white,
                backgroundColor: const Color.fromRGBO(13, 183, 183, 1),
                textStyle: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          const NonSelectedButton(teks: 'Music'),
          const NonSelectedButton(teks: 'Gaming'),
          const NonSelectedButton(teks: 'Domains'),
        ],
      ),
    );
  }
}

class DetailsButton extends StatelessWidget {
  const DetailsButton(
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
    return Container(
      margin: const EdgeInsets.only(top: 375),
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(18.0),
            elevation: 5,
            color: const Color.fromRGBO(18, 18, 18, 1),
            child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                              kreator: kreator,
                              judul: judul,
                              harga: harga,
                              gambar: gambar,
                              kreatorImg: kreatorImg,
                            )),
                  );
                },
                minWidth: 158,
                height: 58,
                child: const Text(
                  'Place Bid',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Manrope',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Material(
            borderRadius: BorderRadius.circular(18.0),
            elevation: 5,
            color: const Color.fromRGBO(13, 183, 183, 1),
            child: MaterialButton(
                onPressed: () {},
                minWidth: 58,
                height: 58,
                child: const Icon(Icons.favorite_border, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class Creator extends StatelessWidget {
  const Creator(
      {Key? key,
      required this.gambar,
      required this.nama,
      required this.pengikut})
      : super(key: key);
  final String gambar;
  final String nama;
  final String pengikut;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93,
      child: Card(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        color: const Color.fromRGBO(236, 236, 236, 1),
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: ListTile(
          leading: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image:
                  DecorationImage(image: AssetImage(gambar), fit: BoxFit.cover),
            ),
          ),
          title: Text(
            nama,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            pengikut + " followers",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

class Creators extends StatelessWidget {
  const Creators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Creator(
            gambar: 'assets/thewatcher.png',
            nama: 'The Watcher',
            pengikut: '576'),
        Creator(
            gambar: 'assets/zeffhood.png', nama: 'Zeff Hood', pengikut: '892'),
        Creator(
            gambar: 'assets/jayanrobs.png',
            nama: 'Jayan Robs',
            pengikut: '707'),
      ],
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/profilepage');
        },
        child: const Text("Edit Profile"));
  }
}
