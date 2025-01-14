import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../app_localizations.dart';
import 'base_ask_user_screen.dart';

class AskUserStep17 extends StatefulWidget {
  const AskUserStep17({Key? key}) : super(key: key);

  @override
  _AskUserStep17State createState() => _AskUserStep17State();
}

class _AskUserStep17State extends State<AskUserStep17> {
  bool _locationPermissionGranted = false;
  bool _galleryPermissionGranted = false;

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        _locationPermissionGranted = true;
      });
    } else {
      if (status.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Permission de localisation refusée"),
          ),
        );
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }

  Future<void> requestGalleryPermission() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      setState(() {
        _galleryPermissionGranted = true;
      });
    } else {
      if (status.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Permission de galerie refusée"),
          ),
        );
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 17,
      totalSteps: 19,
      title: localization?.translate("ask_user_step17_title") ?? "Permissions",
      subtitle: localization?.translate("ask_user_step17_subtitle") ??
          "Veuillez autoriser les permissions nécessaires",
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _locationPermissionGranted
                  ? null
                  : _requestLocationPermission,
              child: Text(
                  localization?.translate("request_location_permission") ??
                      "Request Location Permission"),
            ),
            if (_locationPermissionGranted)
              const Icon(Icons.check_circle, color: Colors.green),
            ElevatedButton(
              onPressed:
                  _galleryPermissionGranted ? null : requestGalleryPermission,
              child: Text(
                  localization?.translate("request_gallery_permission") ??
                      "Request Gallery Permission"),
            ),
            if (_galleryPermissionGranted)
              const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
      onNext: () {
        Navigator.pushNamed(context, '/ask_user_step18');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
