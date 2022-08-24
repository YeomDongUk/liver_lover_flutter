// Package imports:
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LastLoginUserModel extends Equatable {
  LastLoginUserModel({
    this.id = 0,
    required this.userId,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  @Id()
  late int id;
  late String userId;
  @Property(type: PropertyType.date)
  late DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        userId,
        updatedAt,
      ];
}
