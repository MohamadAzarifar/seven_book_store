import 'dart:convert';

class UserEntity {
  final String firstName;
  final String lastName;
  final String nationalCode;
  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.nationalCode,
  });

  UserEntity copyWith({
    String? firstName,
    String? lastName,
    String? nationalCode,
  }) {
    return UserEntity(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nationalCode: nationalCode ?? this.nationalCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'nationalCode': nationalCode,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      nationalCode: map['nationalCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserEntity(firstName: $firstName, lastName: $lastName, nationalCode: $nationalCode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.nationalCode == nationalCode;
  }

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ nationalCode.hashCode;
}
