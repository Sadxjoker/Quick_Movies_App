import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  Future<void> registerUser(
      String email, String password, String username) async {
    isLoading.value = true;
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        final userId = user.id;

        await Supabase.instance.client.from('users').insert({
          'id': userId,
          'email': email,
          'username': username,
        });

        Get.snackbar("Success", "Account created. Check your email.");
      } else {
        // SignUp failed but no explicit error - rare case
        Get.snackbar("Signup Failed", "Unknown error occurred.");
      }
    } on AuthException catch (e) {
      Get.snackbar("Auth Error", e.message);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}
