import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:story_app/core/errors/failure.dart';
import 'package:story_app/features/authentication/data/models/user.dart';
import 'package:story_app/features/authentication/domain/entities/user.dart';
import 'package:story_app/features/authentication/domain/repository/authentication_repository.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    AuthEmailAndPasswordParams params,
  ) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final user = UserModel.createByEmail(
        id: result.user!.uid,
        email: result.user!.email!,
      );

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.ofCode(e.code));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final user = _firebaseAuth.currentUser;

      if (user == null) return Left(FirebaseAuthFailure.ofUnknown());

      UserModel userModel = UserModel.createByEmail(
        id: user.uid,
        email: user.email!,
      );

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.ofCode(e.code));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    params,
  ) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final user = UserModel.createByEmail(
        id: result.user!.uid,
        email: result.user!.email!,
      );

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.ofCode(e.code));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.ofCode(e.code));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
