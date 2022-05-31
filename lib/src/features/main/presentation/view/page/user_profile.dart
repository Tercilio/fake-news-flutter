import 'dart:async';

import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';
import 'package:basearch/src/features/auth/domain/model/user_secure_storage.dart';
import 'package:basearch/src/features/main/presentation/view/page/main_page.dart';
import 'package:basearch/src/features/main/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePage();
}

class _UserProfilePage
    extends ModularState<UserProfilePage, UserProfileViewModel> {
  bool isAccountUpdated = false;
  final _controller = TextEditingController(text: '0');
  final UserOutputDto _user = UserSecureStorage.getUser();

  Widget get _photo => CircleAvatar(
        child: _user.photo.isEmpty
            ? Text(
                _user.fullname.isEmpty ? "T" : _user.fullname[0],
                style: const TextStyle(fontSize: 40.0),
              )
            : ClipOval(
                child: Image.network(
                  _user.photo,
                  fit: BoxFit.cover,
                  width: 115,
                  height: 115,
                ),
              ),
      );

  Widget get _cameraIcon => Positioned(
        right: 0,
        bottom: 0,
        child: SizedBox(
          height: 40,
          width: 40,
          child: TextButton(
            onPressed: () => {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (_) {
                  return const Color(0xFFF5F6F9);
                },
              ),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (_) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  );
                },
              ),
            ),
            child: SvgPicture.asset("lib/assets/images/camera_icon.svg"),
            // child: const Icon(Icons.camera_alt),
          ),
        ),
      );

  Widget get _fullname => Container(
        margin: const EdgeInsets.fromLTRB(25, 20, 25, 0),
        width: double.infinity,
        child: TextFormField(
          initialValue: _user.fullname,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorText:
                store.error.fullname!.isEmpty ? null : store.error.fullname,
            labelText: 'fullname_label'.i18n(),
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),
            prefixIcon: const Icon(Icons.person_rounded),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onChanged: (value) => store.fullname = value,
        ),
      );

  Widget get _birthdate => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: Row(
          children: [
            Flexible(
              flex: 7,
              child: TextFormField(
                key: Key(store.birthdate),
                initialValue: getDate(),
                decoration: InputDecoration(
                  errorText: store.error.birthdate!.isEmpty
                      ? null
                      : store.error.birthdate,
                  labelText: 'birthdate_label'.i18n(),
                  errorStyle: const TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'birthdate_hint'.i18n(),
                  prefixIcon: const Icon(Icons.date_range_rounded),
                  contentPadding: const EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 4.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                enabled: !store.isLoading,
                onTap: () async {
                  final dataPick = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  if (dataPick != null && dataPick != store.birthdate) {
                    setState(() {
                      store.isDateSelected = true;
                      store.birthdate = dataPick
                          .toString()
                          .replaceAll('-', '/')
                          .substring(0, 10);

                      print("Data pick: " + dataPick.toString());
                      calcAge(dataPick);
                    });
                  }
                },
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Flexible(
              flex: 4,
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'age_label'.i18n(),
                  prefixIcon: const Icon(Icons.cake_rounded),
                  contentPadding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 4.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                enabled: false,
              ),
            ),
          ],
        ),
      );

  Widget get _address => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: TextFormField(
          initialValue: "",
          decoration: InputDecoration(
            errorText:
                store.error.address!.isEmpty ? null : store.error.address,
            labelText: 'address_label'.i18n(),
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),
            prefixIcon: const Icon(Icons.room_rounded),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: !store.isLoading,
          onTap: () async {},
        ),
      );

  Widget get _email => Container(
        margin: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        width: double.infinity,
        child: TextFormField(
          initialValue: _user.email,
          decoration: InputDecoration(
            labelText: 'email_label'.i18n(),
            prefixIcon: const Icon(Icons.email_rounded),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          enabled: false,
        ),
      );

  Widget get _saveButton => Center(
        child: Column(
          children: [
            Visibility(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: Text(
                  'updateuser_success'.i18n(),
                  style: const TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
              visible: store.error.updateUser.isEmpty && isAccountUpdated,
            ),
            Visibility(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: Text(
                  store.error.updateUser,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
              visible: store.error.updateUser.isNotEmpty,
            ),
            Visibility(
              child: Container(
                height: 56,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(180, 56)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  onPressed: () async {
                    isAccountUpdated = await store.updateUser();

                    if (isAccountUpdated) startTime();
                  },
                  child: Text('updateuser'.i18n()),
                ),
              ),
              visible: !isAccountUpdated,
            ),
          ],
        ),
      );

  Widget get _profilePhoto => SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [_photo, _cameraIcon],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Profile"),
        backgroundColor: const Color.fromARGB(255, 135, 151, 178),
        iconTheme: const IconThemeData(color: Colors.black),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(children: [
            _profilePhoto,
            _fullname,
            _birthdate,
            _address,
            _email,
            _saveButton
          ]),
        ),
      ),
    );
  }

  calcAge(DateTime dateTime) {
    DateTime dateToday = DateTime.now().add(const Duration(
        hours: 0, microseconds: 0, milliseconds: 0, minutes: 0, seconds: 0));

    dateTime.add(const Duration(
        hours: 0, microseconds: 0, milliseconds: 0, minutes: 0, seconds: 0));

    int age = (dateToday.difference(dateTime).inDays / 365).floor();
    store.age = age.toString();

    setState(() => _controller.text = store.age);
  }

  getDate() {
    if (store.birthdate.isEmpty && _user.birthdate.isEmpty) {
      return "";
    }

    return store.birthdate.isEmpty
        ? formatDate(_user.birthdate)
        : formatDate(store.birthdate);
  }

  formatDate(String date) {
    date = date.replaceAll('/', '-');
    return DateFormat("date_format".i18n()).format(DateTime.parse(date));
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }
}
