import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/login_controller.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key})
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
        decoration: AppDecoration.fillOnPrimary,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(
                left: 28.h,
                right: 28.h,
                bottom: 140.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 20.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgSecondLogo,
                    height: 68.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 16.h),
                  ),
                  SizedBox(height: 40.h),
                  _buildLoginFormSection()
                ],
              ),
            ),
          )
        )
      )
    );
  }

  //
  Widget _buildUsernameInput () {
    return CustomTextFormField(
      controller: controller.usernameInputController,
      hintText: "lbl_username".tr,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
      fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(0.25),
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
      hintText: "lbl_password".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 10.h,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
      fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(0.25),
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "err_msg_please_enter_valid_Password".tr;
        }
        return null;
      },
    );
  }

  //
  Widget _buildLoginButton(){
    return CustomElevatedButton(
      text: "lbl_login".tr,
    );
  }

  //
  Widget _buildGoogleLoginButton(){
    return CustomOutlinedButton(
      text: "msg_login_with_google".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 10.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: 22.h,
          width: 22.h,
          fit: BoxFit.contain,
        ),
      ),
      buttonTextStyle: CustomTextStyles.labelLargeSecondaryContainer,
      onPressed: (){
        onTapGoogleLoginButton();
      },
    );
  }

  // 
  Widget _buildRegisterButton(){
    return CustomElevatedButton(
      text: "lbl_register".tr,
      buttonStyle: CustomButtonStyle.fillOnPrimaryContainer,
    );
  }

  //
  Widget _buildLoginFormSection(){
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.outlineOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.rounderBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg_log_in_to_your_account".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 20.h),
          _buildUsernameInput(),
          SizedBox(height: 20.h),
          _buildPasswordInput(),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "msg_forgot_password".tr,
              style: 
              CustomTextStyles.bodySmallMicrosoftSansSerifRedA700.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 14.h,),
          _buildLoginButton(),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                      "lbl_or".tr,
                      style: theme.textTheme.bodySmall,
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 12.h,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          _buildGoogleLoginButton(),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(),
                ),
                SizedBox(width: 12.h),
                Text(
                  "msg_dont_have_account".tr,
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(width: 12.h),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          _buildRegisterButton(),
          SizedBox(height: 4.h),         
        ],
      )
    );
  }

  onTapGoogleLoginButton() async{
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError){
      Get.snackbar('Error', onError.toString());
    });
  }
}
