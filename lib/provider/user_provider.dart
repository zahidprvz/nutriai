import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutriai/models/user.dart';

class UserProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserData _user = UserData(); // Initialize with default values
  bool _isDataLoaded = false;

  UserData get user => _user;
  bool get isDataLoaded => _isDataLoaded;

  bool get isRegistered {
    return _user.isRegistered ?? false;
  }

  UserProvider() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _loadUserData(user.uid);
      } else {
        // Reset data if the user logs out
        _user = UserData();
        _isDataLoaded = false;
        notifyListeners();
      }
    });
  }

  Future<void> _loadUserData(String uid) async {
    _isDataLoaded = false;

    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        _user = UserData.fromFirestore(data);
      } else {
        // Handle case where user document doesn't exist (maybe a new signup)
        _user = UserData(); // Set default values or handle as needed
      }
    } catch (e) {
      print("Error loading user data: $e");
      // Handle error, maybe set _user to default values or show an error state
    } finally {
      _isDataLoaded = true;
      notifyListeners();
    }
  }

  // Method to update isRegistered after completing onboarding
  Future<void> completeRegistration() async {
    if (_auth.currentUser != null) {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'isRegistered': true});
      // _user.isRegistered = true; // No need to set this here
      notifyListeners();
    }
  }

  // Updated updateUser method with all parameters:
  Future<void> updateUser(BuildContext context,
      {String? goal,
      double? height,
      double? weight,
      DateTime? birthDate,
      double? desiredWeight,
      String? workoutsPerWeek,
      String? gender,
      String? triedCalorieTracking,
      double? gainPerWeek,
      List<String>? reasonsForNotReachingGoals,
      String? diet,
      List<String>? accomplishments,
      double? rating}) async {
    if (_auth.currentUser == null) {
      // Handle the case where the user is not logged in
      return;
    }

    try {
      // Update Firestore document
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        if (goal != null) 'goal': goal,
        if (height != null) 'height': height,
        if (weight != null) 'weight': weight,
        if (birthDate != null) 'birthDate': birthDate,
        if (desiredWeight != null) 'desiredWeight': desiredWeight,
        if (workoutsPerWeek != null) 'workoutsPerWeek': workoutsPerWeek,
        if (gender != null) 'gender': gender,
        if (triedCalorieTracking != null)
          'triedCalorieTracking': triedCalorieTracking,
        if (gainPerWeek != null) 'gainPerWeek': gainPerWeek,
        if (reasonsForNotReachingGoals != null)
          'reasonsForNotReachingGoals': reasonsForNotReachingGoals,
        if (diet != null) 'diet': diet,
        if (accomplishments != null) 'accomplishments': accomplishments,
        if (rating != null) 'rating': rating,
      });

      // Update local user data
      _user = _user.copyWith(
        goal: goal,
        height: height,
        weight: weight,
        birthDate: birthDate,
        desiredWeight: desiredWeight,
        workoutsPerWeek: workoutsPerWeek,
        gender: gender,
        triedCalorieTracking: triedCalorieTracking,
        gainPerWeek: gainPerWeek,
        reasonsForNotReachingGoals: reasonsForNotReachingGoals,
        diet: diet,
        accomplishments: accomplishments,
        rating: rating,
      );

      notifyListeners();
    } catch (e) {
      print("Error updating user data: $e");
      // Handle error (e.g., show a snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update user data: $e")),
      );
    }
  }
}
