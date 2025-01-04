import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart'; 
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/register_controller.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends GetWidget<RegisterController> {
  RegisterScreen({Key? key})
    : super(
        key: key,
      );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.onPrimary,
      body: Container(
        width: double.maxFinite,
        height: SizeUtils.height,
        decoration: AppDecoration.fillOnPrimary1,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(28.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSecondLogo,
                    height: 68.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 16.h),
                  ),
                  SizedBox(height: 24.h),
                  _buildRegistrationForm()
                ],
              ),
            ),
          ),
        ), 
      ),
    );
  }

  //
  Widget _buildEmailInput(){
    return CustomTextFormField(
      controller: controller.emailInputController,
      hintText: "msg_enter_your_email".tr,
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
      validator: (value){
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "err_msg_please_enter_valid_email".tr;
        }
        return null;
      },
    );
  }

  //
  Widget _buildUsernameInput () {
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

  //
  Widget _buildPasswordInput () {
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

  //
  Widget _buildRepeatPasswordInput(){
    return CustomTextFormField(
      controller: controller.passwordInputController,
      hintText: "lbl_enter_password".tr,
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

  //
  Widget _buildRegisterButton() {
    return CustomElevatedButton(
      text: "lbl_register".tr,
      buttonTextStyle: CustomTextStyles.labelMediumInterOnPrimary,
    );
  }

  //
  Widget _buildBackToLoginButton() {
    return CustomElevatedButton(
      text: "lbl_back_to_login".tr,
      buttonStyle: CustomButtonStyle.fillErorContainer,
      buttonTextStyle: CustomTextStyles.labelMediumInterOnPrimary,
    );
  }

  //
  Widget _buildRegistrationForm(){
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.h,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.rounderBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "lbl_register2".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 14.h),
          _buildEmailInput(),
          SizedBox(height: 14.h),
          _buildUsernameInput(),
          SizedBox(height: 14.h),
          _buildPasswordInput(),
          SizedBox(height: 14.h),
          _buildRepeatPasswordInput(),
          SizedBox(height: 34.h),
          _buildRegisterButton(),
          SizedBox(height: 14.h),
          _buildBackToLoginButton(),
          SizedBox(height: 26.h),
        ],
      ),
    );
  }
}