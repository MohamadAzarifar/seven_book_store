import 'package:book_store/entity/user_entity.dart';

class AuthorEntity extends UserEntity {
  AuthorEntity(
      {required super.firstName,
      required super.lastName,
      required super.nationalCode});

  factory AuthorEntity.fromMap(Map<String, dynamic> map) => AuthorEntity(
        firstName: map['firstName'],
        lastName: map['lastName'],
        nationalCode: map['nationalCode'],
      );
}
