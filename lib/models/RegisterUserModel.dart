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

  RegisterUserModel copyWith({
    String? firstName,
    String? lastName,
    String? appLanguage,
    ClientStatus? clientStatus,
    String? address,
    String? phoneNumber,
    String? taskDescription,
  }) {
    return RegisterUserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      appLanguage: appLanguage ?? this.appLanguage,
      clientStatus: clientStatus ?? this.clientStatus,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      taskDescription: taskDescription ?? this.taskDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'appLanguage': appLanguage,
      'clientStatus': clientStatus?.toString().split('.').last,
      'address': address,
      'phoneNumber': phoneNumber,
      'taskDescription': taskDescription,
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      appLanguage: map['appLanguage'],
      clientStatus: map['clientStatus'] != null
          ? ClientStatus.values.firstWhere(
              (e) => e.toString().split('.').last == map['clientStatus'],
          orElse: () => ClientStatus.client)
          : null,
      address: map['address'],
      phoneNumber: map['phoneNumber'],
      taskDescription: map['taskDescription'],
    );
  }

  static RegisterUserModel EmptyUserRegistryModel(){
    return RegisterUserModel();
  }
}

