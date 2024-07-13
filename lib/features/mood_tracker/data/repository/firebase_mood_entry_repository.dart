import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/entities/mood_entry.dart';
import 'package:story_app/features/mood_tracker/domain/repository/mood_entry_repository.dart';

class FirebaseMoodEntryRepository implements MoodEntryRepository {
  final db = FirebaseFirestore.instance;

  static const String moodEntriesRef = 'mood_entries';

  @override
  Future<Either<Failure, List<MoodEntryEntity>>> findMoodEntriesByMonth(
    DateTime date,
  ) async {
    try {
      // final snapshot = await database.ref(moodEntriesRef).once();

      return const Right([]); // TODO: Implement
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, MoodEntryModel>> add(
      MoodEntryModel moodEntryModel) async {
    try {
      final result =
          await db.collection(moodEntriesRef).add(moodEntryModel.toJson());

      print("result id: $result");

      return Right(MoodEntryModel.fromJson(const {}));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
