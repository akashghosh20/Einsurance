import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:logsign/pages/CongratsStudent.dart';

class healthInsuForm extends StatefulWidget {
  const healthInsuForm({Key? key}) : super(key: key);

  @override
  _healthInsuFormState createState() => _healthInsuFormState();
}

class _healthInsuFormState extends State<healthInsuForm> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var Name = "";
  var gender = "";
  var age = "";
  var presentAddress = "";
  var permanentAddress = "";
  bool isComplete = false;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final religionController = TextEditingController();
  final ageController = TextEditingController();
  final institutionController = TextEditingController();
  final classController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final presentAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();
  // final scoreController = TextEditingController();
  String? url;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    userNameController.dispose();
    nameController.dispose();
    genderController.dispose();
    religionController.dispose();
    ageController.dispose();

    // scoreController.dispose();
    super.dispose();
  }

  // Adding Student
  CollectionReference pids =
      FirebaseFirestore.instance.collection('healthInsurance');

  Future<void> addUser() async {
    // final imgurl = await uploadImage(_image!);
    isComplete = true;
    return pids
        .add({
          'email': email,
          'name': Name,
          'gender': gender,
          'age': age,
          'present address': presentAddress,
          'permanent address': permanentAddress,
          // 'image url': url,
          // 'score': score,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  // File? _image;
  // final picker = imagePicker();
  // String? downloadUrl;

  // Future imagePicker() async {
  //   try {
  //     final pick = await picker.pickImage(source: ImageSource.gallery);
  //     setState(() {
  //       if (pick != null) {
  //         _image = File(pick.path);
  //       }
  //     });
  //   } catch (e) {}
  // }

  // Future uploadImage(File _image) async {
  //   String imgId = DateTime.now().microsecondsSinceEpoch.toString();

  //   Reference refrence =
  //       FirebaseStorage.instance.ref().child('images').child('user$imgId');
  //   await refrence.putFile(_image);
  //   url = await refrence.getDownloadURL();
  // }

  @override
  void initState() {
    // userNameController.text = UserSharedPreference().getUserName() ?? "";
    // institutionController.text =
    //     UserSharedPreference().getStudentInstitution() ?? "";
    // classController.text = UserSharedPreference().getClassStudent() ?? "";
    // ageController.text = UserSharedPreference().getAge() ?? "";
    // phoneController.text = UserSharedPreference().getNumber() ?? "";
    // religionController.text = UserSharedPreference().getReligion() ?? "";
    // cityController.text = UserSharedPreference().getCity() ?? "";
    // addressController.text = UserSharedPreference().getDetailsAddress() ?? "";
    // emailController.text = UserSharedPreference().getEmail() ?? "";
    // nameController.text = UserSharedPreference().getName() ?? "";
    // genderController.text = UserSharedPreference().getGender() ?? "";

    // url = UserSharedPreference().getImageStudent() ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Complete your profile"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              // Container(
              //     height: 250,
              //     width: 250,
              //     child: Column(
              //       children: [
              //         const Text(
              //           "ছবি যুক্ত করুন",
              //           style: TextStyle(
              //               fontSize: 22, fontWeight: FontWeight.bold),
              //         ),
              //         Expanded(
              //           flex: 2,
              //           child: Container(
              //             width: 250,
              //             height: 250,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(20),
              //                 border: Border.all(
              //                     color: const Color.fromARGB(255, 255, 0, 0))),
              //             child: Center(
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: _image == null
              //                         ? Center(
              //                             child: Image.asset(
              //                             "assets/images/profile.png",
              //                             height: 150,
              //                             width: 150,
              //                           ))
              //                         : Image.file(_image!,
              //                             height: 150,
              //                             width: 150,
              //                             fit: BoxFit.contain),
              //                   ),
              //                   ElevatedButton(
              //                       style: ButtonStyle(
              //                           backgroundColor:
              //                               MaterialStateProperty.all(
              //                                   const Color.fromARGB(
              //                                       255, 255, 0, 0))),
              //                       onPressed: () {
              //                         imagePicker();
              //                       },
              //                       child: const Text("ছবি সিলেক্ট করুন")),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     )),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20),
              Container(
                // this container is the value box for taking inputs
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Give your name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Give your email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    labelText: 'Present Address',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  controller: presentAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Give your present address';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    labelText: 'Permanent Address',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  controller: permanentAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Give your permanent address';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    labelText: 'Gender',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  controller: genderController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Male/Female ?';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Age',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Give your age';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() async {
                            email = emailController.text;
                            presentAddress = presentAddressController.text;
                            Name = nameController.text;
                            gender = genderController.text;
                            permanentAddress = permanentAddressController.text;
                            age = ageController.text;

                            // score = scoreController.text;
                            addUser();

                            // await UserSharedPreference()
                            //     .setUserName(userNameController.text);
                            // await UserSharedPreference().setStudentInstitution(
                            //     institutionController.text);
                            // await UserSharedPreference().setImageStudent(url!);
                            // await UserSharedPreference()
                            //     .setAge(ageController.text);
                            // await UserSharedPreference()
                            //     .setNumber(phoneController.text);
                            // await UserSharedPreference()
                            //     .setCity(cityController.text);
                            // await UserSharedPreference()
                            //     .setDetailsAddress(addressController.text);
                            // await UserSharedPreference()
                            //     .setClassStudent(classController.text);
                            // await UserSharedPreference()
                            //     .setName(nameController.text);
                            // await UserSharedPreference()
                            //     .setReligion(religionController.text);
                            // await UserSharedPreference()
                            //     .setEmail(emailController.text);
                            // await UserSharedPreference()
                            //     .setGender(genderController.text);
                            // // await UserSharedPreference()
                            // //     .setScore(scoreController.text);
                            // Get.to(const CongratsStudent());
                          });
                        }
                      },
                      child: const Text(
                        'Complete',
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
