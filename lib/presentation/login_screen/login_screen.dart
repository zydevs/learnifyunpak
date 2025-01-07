import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/waves_dots_loading.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

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

  // Login method
  void userLogin(BuildContext context) async {
    // Show loading dialog
    showWaveDotsLoading(context);

    // Proses login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: controller.emailInputController.text.trim(),
        password: controller.passwordInputController.text.trim(),
      );

      // Berhasil login
      Navigator.of(context).pop(); // Tutup loading dialog
      Get.snackbar("Success", "You have successfully logged in.");
      Get.offNamed(AppRoutes.homeScreen); // Arahkan ke home screen
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Tutup loading dialog

      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No Email found.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password.");
      } else {
        Get.snackbar("Error", "Your Email or Password is incorrect.");
      }
    } catch (e) {
      Navigator.of(context).pop(); // Tutup loading dialog
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: theme.colorScheme.onPrimary,
      body: Container(
        width: double.maxFinite,
        height: SizeUtils.height,
        decoration: AppDecoration.fillOnPrimary,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.0), // Spasi atas

                    // Logo di atas
                    CustomImageView(
                      imagePath: ImageConstant.imgSecondLogo,
                      height: 69.0,
                      width: 310.0,
                    ),

                    SizedBox(height: 20.0),

                    // Bungkus elemen-elemen dalam kontainer dengan dekorasi
                    Container(
                      padding: EdgeInsets.all(
                          20.0), // Memberi jarak di dalam kontainer
                      constraints: BoxConstraints(
                        maxWidth: 410, // Maksimal lebar kontainer
                        minWidth: 330, // Minimal lebar kontainer
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Judul "Log in to Your Account"
                          Text(
                            "msg_log_in_to_your_account".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 30.0),

                          // Input Username
                          _buildUsernameInput(),
                          SizedBox(height: 20.0),

                          // Input Password
                          _buildPasswordInput(),
                          SizedBox(height: 10.0),

                          SizedBox(height: 20.0),

                          // Tombol Login
                          _buildLoginButton(context),

                          SizedBox(height: 20.0),

                          // Divider dengan teks "OR"
                          Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("lbl_or".tr,
                                    style: theme.textTheme.bodySmall),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),

                          SizedBox(height: 20.0),

                          // Tombol Login dengan Google
                          _buildGoogleLoginButton(),

                          SizedBox(height: 20.0),

                          // Divider dengan teks "Don't Have Account"
                          Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("Dont Have Account?".tr,
                                    style: theme.textTheme.bodySmall),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),

                          SizedBox(height: 20.0),

                          // Tombol Register
                          _buildRegisterButton(),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.0), // Spasi bawah
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Input Email
  Widget _buildUsernameInput() {
    return CustomTextFormField(
      controller: controller.emailInputController,
      hintText: "Email".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
      fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(0.25),
    );
  }

  // Input Password
  Widget _buildPasswordInput() {
    return CustomTextFormField(
      controller: controller.passwordInputController,
      hintText: "lbl_password".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
      fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(0.25),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_login".tr,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          userLogin(context); // Meneruskan BuildContext ke userLogin
        } else {
          Get.snackbar("Error", "Please fill in all required fields.");
        }
      },
    );
  }

  Widget _buildGoogleLoginButton() {
    return CustomOutlinedButton(
      text: "msg_login_with_google".tr,
      leftIcon: Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: 22.0,
          width: 22.0,
          fit: BoxFit.contain,
        ),
      ),
      buttonTextStyle: CustomTextStyles.labelLargeSecondaryContainer,
      onPressed: onTapGoogleLoginButton,
    );
  }

  Widget _buildRegisterButton() {
    return CustomElevatedButton(
      text: "lbl_register".tr,
      buttonStyle: CustomButtonStyle.fillOnPrimaryContainer,
      onPressed: () {
        Get.toNamed(AppRoutes.registerScreen);
      },
    );
  }

  void onTapGoogleLoginButton() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        // Perform actions after successful Google login
      } else {
        Get.snackbar('Error', 'User data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }
}
