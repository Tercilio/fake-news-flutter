import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserProfilePage extends StatelessWidget {
  final UserOutputDto _user;
  const UserProfilePage(this._user, {Key? key}) : super(key: key);

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

  Widget get _profilePhoto => SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          // clipBehavior: Clip.none,
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
          child: Column(children: [_profilePhoto, const SizedBox(height: 20)]),
        ),
      ),
    );
  }
}
