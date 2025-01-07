import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var fullName = ''.obs;

  // Ambil data pengguna dari Firestore
  void fetchUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Ambil data pengguna dari Firestore berdasarkan UID
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Periksa apakah dokumen ada dan ambil `fullName`
        if (userDoc.exists) {
          fullName.value = userDoc['fullName'] ?? 'No Name'; // Gantilah 'fullName' dengan field yang sesuai di Firestore
        }
      }
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }
}
