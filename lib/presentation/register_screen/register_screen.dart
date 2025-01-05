import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart'; 
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/register_controller.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends GetWidget<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true, // Pastikan ini true untuk mencegah overflow
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
      validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "err_msg_please_enter_valid_email".tr;
        }
        return null;
      },
    );
  }

  Widget _buildUsernameInput() {
    return CustomTextFormField(
      controller: controller.usernameInputController,
      hintText: "lbl_enter_username".tr,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
      validator: (value) {
        if (!isText(value)) {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
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
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "err_msg_please_enter_valid_Password".tr;
        }
        return null;
      },
    );
  }

  Widget _buildRepeatPasswordInput() {
    return CustomTextFormField(
      controller: controller.repeatPasswordInputController,
      hintText: "lbl_repeat_password".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "err_msg_please_enter_valid_Password".tr;
        }
        return null;
      },
    );
  }

  Widget _buildRegisterButton() {
    return CustomElevatedButton(
      text: "lbl_register".tr,
      buttonTextStyle: CustomTextStyles.labelMediumInterOnPrimary,
      onPressed: () {
        Get.toNamed(AppRoutes.loginScreen);
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
              _buildRegisterButton(),
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
