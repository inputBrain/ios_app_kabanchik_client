import 'ClientStatus.dart';

class RegisterUserModel {
  String? firstName;
  String? lastName;
  String? appLanguage;
  ClientStatus? clientStatus;
  String? address;
  String? phoneNumber;
  String? taskDescription;

  RegisterUserModel({
    this.firstName,
    this.lastName,
    this.appLanguage,
    this.clientStatus,
    this.address,
    this.phoneNumber,
    this.taskDescription,
  });


  static RegisterUserModel emptyUserRegistryModel(){
    return RegisterUserModel();
  }
}

