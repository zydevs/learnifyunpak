import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/register_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/waves_dots_loading.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends GetWidget<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // loading method
  void showWaveDotsLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Mencegah dialog tertutup tanpa aksi
      builder: (context) {
        return const Center(
          child: WaveDotsLoading(), // Animasi loading
        );
      },
    );
  }

  void userRegis(BuildContext context) async {
    // Tampilkan loading dialog
    showWaveDotsLoading(context);

    // Proses registrasi
    try {
      // Periksa apakah password dan repeat password cocok
      if (controller.passwordInputController.text.trim() ==
          controller.confirmPasswordInputController.text.trim()) {
        
        // Proses pendaftaran akun dengan Firebase
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controller.emailInputController.text.trim(),
          password: controller.passwordInputController.text.trim(),
        );

        // Menyimpan username dan data lainnya ke Firestore setelah pendaftaran
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
          'fullName': controller.fullNameInputController.text.trim(),
          'email': controller.emailInputController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Menutup loading dialog
        Get.back(); // Menggunakan Get untuk menutup dialog loading

        // Menampilkan snackbar success
        Get.snackbar("Success", "Your account has been successfully created. Please Login!");

        // Pindah ke halaman login
        Get.offNamed(AppRoutes.loginScreen);

      } else {
        // Jika password tidak cocok
        Get.back(); // Menutup loading dialog
        Get.snackbar("Error", "Passwords don't match!");
      }

    } catch (e) {
      // Menutup loading dialog
      Get.back();

      // Menampilkan snackbar error
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset:
          true, // Pastikan ini true untuk mencegah overflow
      backgroundColor: theme.colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          height: SizeUtils.height, // Sesuaikan tinggi agar scroll dinamis
          decoration: AppDecoration.fillOnPrimary1,
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(28.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSecondLogo,
                      height: 69.0,
                      width: 310.0,
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                    ),
                    SizedBox(height: 24.h),
                    _buildRegistrationForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return CustomTextFormField(
      controller: controller.emailInputController,
      hintText: "msg_enter_your_email".tr,
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
    );
  }

  Widget _buildUsernameInput() {
    return CustomTextFormField(
      controller: controller.fullNameInputController,
      hintText: "Enter Full Name".tr,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
    );
  }

  Widget _buildPasswordInput() {
    return CustomTextFormField(
      controller: controller.passwordInputController,
      hintText: "lbl_enter_password".tr,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
    );
  }

  Widget _buildRepeatPasswordInput() {
    return CustomTextFormField(
      controller: controller.confirmPasswordInputController,
      hintText: "Confirm Password".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_register".tr,
      buttonTextStyle: CustomTextStyles.labelMediumInterOnPrimary,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          userRegis(Get.context!); // Meneruskan BuildContext ke userLogin
        } else {
          Get.snackbar("Error", "Please fill in all required fields.");
        }
      },
    );
  }

  Widget _buildBackToLoginButton() {
    return CustomElevatedButton(
      text: "lbl_back_to_login".tr,
      buttonStyle: CustomButtonStyle.fillErorContainer,
      buttonTextStyle: CustomTextStyles.labelMediumInterOnPrimary,
      onPressed: () {
        Get.toNamed(AppRoutes.loginScreen);
      },
    );
  }

  Widget _buildRegistrationForm() {
    return Flexible(
      child: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 20.h,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0x3F000000)),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "lbl_register2".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 14.h),
              _buildEmailInput(),
              SizedBox(height: 14.h),
              _buildUsernameInput(),
              SizedBox(height: 14.h),
              _buildPasswordInput(),
              SizedBox(height: 14.h),
              _buildRepeatPasswordInput(),
              SizedBox(height: 24.h),
              _buildRegisterButton(Get.context!),
              SizedBox(height: 14.h),
              _buildBackToLoginButton(),
              SizedBox(height: 26.h),
            ],
          ),
        ),
      ),
    );
  }
}
