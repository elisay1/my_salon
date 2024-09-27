import 'package:flutter/material.dart';
import 'package:solbank_app/src/screens/auth/singn_up/successfull_validation.dart';
import 'package:solbank_app/src/screens/management/account/my_acount.dart';
import 'package:solbank_app/src/screens/management/movements.dart';
import 'package:solbank_app/src/screens/management/operations.dart';
import 'package:solbank_app/src/screens/personal_data/additional_information/activity_data%20.dart';
import 'package:solbank_app/src/screens/personal_data/additional_information/politically_exposed_person.dart';
import 'package:solbank_app/src/screens/personal_data/additional_information/residence_data.dart';
import 'package:solbank_app/src/screens/personal_data/additional_information/residence_ocupation.dart';
import 'package:solbank_app/src/screens/personal_data/validate_identity/personal_data.dart';
import 'package:solbank_app/src/screens/personal_data/additional_information/additional_information.dart';
import 'package:solbank_app/src/screens/personal_data/validate_identify.dart';
import 'package:solbank_app/src/screens/personal_data/validate_identity/successfull_data.dart';
import 'package:solbank_app/src/screens/splash_screen.dart';
import 'package:solbank_app/src/screens/management/home_screen.dart';
import 'package:solbank_app/src/screens/welcome_screen.dart';
import 'package:solbank_app/src/screens/auth/singn_in/login_screen.dart';
import 'package:solbank_app/src/screens/auth/singn_up/register_screen..dart';
import 'package:solbank_app/src/screens/auth/singn_up/email_verification.dart';
import 'package:solbank_app/src/routes/routes.dart';

//Ahora creamos las rutas asi a donde nos van a dirigir
Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.splash: (_) => const SplashPage(),
  Routes.home: (_) => const HomePage(),
  Routes.operations: (_) => const Operations(),
  Routes.movements: (_) => const Movements(),
  Routes.myAcount: (_) => const MyAcount(),
  Routes.inicio: (_) => const InicioPage(),
  Routes.signIn: (_) => const LoginPage(),
  Routes.signUp: (_) => const RegisterPage(),
  Routes.emailVerification: (_) => const EmailVerificationPage(),
  Routes.successFullValidation: (_) => const SuccessFullValidationPage(),
  Routes.personalData: (_) => const PersonalData(),
  Routes.successfullData: (_) => const SuccessFullDataPagePage(),
  Routes.validateIdentify: (_) => const ValidateIdentifyPage(),
  Routes.additionalInformation: (_) => const AdditionalInformationPage(),
  Routes.residenceData: (_) => const ResidenceDataPage(),
  Routes.activityData: (_) => const ActivityDataPagePage(),
  Routes.residenceOcupation: (_) => const ResidenceOcupationPage(),
   Routes.politicallyExposedPerson: (_) => const PoliticallyExposedPersonPage(),
};
