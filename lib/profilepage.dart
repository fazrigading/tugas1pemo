// ignore_for_file: no_logic_in_create_state, must_be_immutable
import 'package:flutter/material.dart';
import 'button.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/bakc.png'),
                      fit: BoxFit.cover))),
          const Text("Fazri Gading",
              style: TextStyle(
                  color: Color.fromRGBO(18, 18, 18, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w800)),
          const Text("@fazrigading",
              style: TextStyle(
                  color: Color.fromRGBO(18, 183, 183, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: const EditProfileButton()),
        ],
      ),
    ]);
  }
}

class EditProfile extends StatefulWidget {
  EditProfile(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.emailAddress,
      required this.chosenGender})
      : super(key: key);
  String firstName, lastName, emailAddress;
  List gender;
  int chosenGender;
  @override
  State<EditProfile> createState() => _EditProfileState(
      firstName, lastName, emailAddress, gender, chosenGender);
}

class _EditProfileState extends State<EditProfile> {
  String firstName, lastName, emailAddress, chosenRadio = "Male";
  TextEditingController ctrFirst = TextEditingController();
  TextEditingController ctrLast = TextEditingController();
  TextEditingController ctrEmail = TextEditingController();
  int idRadio = 1, chosenGender;
  List gender;
  _EditProfileState(this.firstName, this.lastName, this.emailAddress,
      this.gender, this.chosenGender);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctrFirst.dispose();
    ctrLast.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Edit Profile",
            style: TextStyle(
                fontFamily: 'Manrope',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          toolbarHeight: 70,
        ),
        body: Center(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.person,
                  size: 256,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text("$firstName $lastName",
                        style: const TextStyle(
                            fontFamily: 'Manrope',
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600)),
                    Text(emailAddress),
                    Text("Gender: " + gender[chosenGender]),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: TextFormField(
                  controller: ctrFirst,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "First Name",
                      hintText: "ex: Fazri"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: TextFormField(
                  controller: ctrLast,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Last Name",
                      hintText: "ex: Gading"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: TextFormField(
                  controller: ctrEmail,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email Address",
                      hintText: "ex: fazrigading@gmail.com"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Gender:"),
                    Radio(
                      value: 1,
                      groupValue: idRadio,
                      onChanged: (val) {
                        setState(() {
                          chosenRadio = "Male";
                          idRadio = 1;
                        });
                      },
                    ),
                    const Text("Male"),
                    Radio(
                      value: 2,
                      groupValue: idRadio,
                      onChanged: (val) {
                        setState(() {
                          chosenRadio = "Female";
                          idRadio = 2;
                        });
                      },
                    ),
                    const Text("Female"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child:
                    ButtonBar(alignment: MainAxisAlignment.center, children: [
                  Material(
                    borderRadius: BorderRadius.circular(18.0),
                    elevation: 5,
                    color: const Color.fromRGBO(18, 18, 18, 1),
                    child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            firstName = ctrFirst.text;
                            lastName = ctrLast.text;
                            emailAddress = ctrEmail.text;
                            chosenGender = idRadio - 1;
                          });
                        },
                        minWidth: 150,
                        height: 58,
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
