import '../../res/images.dart';
import 'index.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/LoginScreen';

  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.size_14),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.size_24),
                      child: Image.asset(AppImages.imgGameTv),
                    ),
                    TextWidget(
                        text: Localization.of(context)?.welcomeBack,
                        textSize: SizeConfig.font_32,
                        fontWeight: FontStyles.semiBold),
                    SizedBox(height: SizeConfig.size_16),
                    TextWidget(
                        text: Localization.of(context)?.loginWithUserName,
                        textSize: SizeConfig.font_18),
                    SizedBox(height: SizeConfig.size_16),
                    CustomRoundTextField(
                        maxLength: 11,
                        validator: (value) {
                          return Validator.validateUserName(value!);
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                              LoginUserNameChanged(userName: value.trim()));
                        },
                        hintText: Localization.of(context)?.userName,
                        iconAsset: AppIcons.icMail),
                    CustomRoundTextField(
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        maxLength: 11,
                        validator: (value) {
                          return Validator.validatePassword(value!);
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                              LoginPasswordChanged(password: value.trim()));
                        },
                        hintText: Localization.of(context)?.password,
                        iconAsset: AppIcons.icPassword),
                    SizedBox(height: SizeConfig.size_24),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            /*  Navigator.pushNamed(
                                    context, ForgotPasswordScreen.id);*/
                          },
                          child: TextWidget(
                              text: Localization.of(context)?.forgotPassword,
                              color: AppColors.colorPrimary,
                              textSize: SizeConfig.font_18),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.size_24),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (cxt, state) {
                        if (state.isLoggedIn!) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      },
                      listenWhen: (previous, current) =>
                          previous.isLoggedIn != current.isLoggedIn,
                      buildWhen: (previous, current) =>
                          previous.isFormValid != current.isFormValid,
                      builder: (context, state) => RoundedButton(
                          text:
                              Localization.of(context)?.txtLogin.toUpperCase(),
                          color: AppColors.colorWhite,
                          backgroundColor: state.isFormValid!
                              ? AppColors.colorPrimary
                              : AppColors.colorGray,
                          onTap: state.isFormValid!
                              ? () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    _formKey.currentState?.save();
                                    context
                                        .read<LoginBloc>()
                                        .add(const LoginSubmitted());
                                  }
                                }
                              : null),
                    ),
                    SizedBox(height: SizeConfig.size_16),
                    Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    Localization.of(context)?.notHaveAnAccount,
                                style: TextStyle(
                                    fontWeight: FontStyles.regular,
                                    color: AppColors.colorBlack,
                                    fontSize: SizeConfig.font_18)),
                            TextSpan(
                                text: Localization.of(context)
                                    ?.txtSignUpWithEmail,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    /* Navigator.pushNamedAndRemoveUntil(context,
                                        SignUpScreen.id, (route) => false);*/
                                  },
                                style: TextStyle(
                                    fontWeight: FontStyles.semiBold,
                                    color: AppColors.colorPrimary,
                                    decoration: TextDecoration.underline,
                                    fontSize: SizeConfig.font_18)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ]),
    ));
  }
}
