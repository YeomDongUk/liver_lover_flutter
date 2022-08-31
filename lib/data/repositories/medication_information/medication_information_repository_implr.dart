// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:yak/core/error/failure.dart';
import 'package:yak/core/user/user_id.dart';
import 'package:yak/data/datasources/local/medication_information/medication_information_local_data_source.dart';
import 'package:yak/domain/entities/medication_information/medication_information.dart';
import 'package:yak/domain/repositories/medication_information/medication_information_repository.dart';

class MedicationInformationRepositoryImpl
    implements MedicationInformationRepository {
  MedicationInformationRepositoryImpl({
    required this.medicationInformationLocalDataSource,
    required this.userId,
  });

  final UserId userId;

  final MedicationInformationLocalDataSource
      medicationInformationLocalDataSource;
  @override
  Either<Failure, Stream<List<MedicationInformation>>>
      getMedicationInformationsStream() => Right(
            medicationInformationLocalDataSource
                .getMedicationInformationModelsStream(
                  userId: userId.value,
                )
                .map(
                  (medicationInformationModels) => medicationInformationModels
                      .map(
                        (medicationInformationModel) =>
                            MedicationInformation.fromJson(
                          medicationInformationModel.toJson(),
                        ),
                      )
                      .toList(),
                ),
          );
}
