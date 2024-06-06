import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result_firebase.freezed.dart';

@freezed
abstract class ApiResultFirebase<T> with _$ApiResultFirebase<T> {
  const factory ApiResultFirebase.success(T data) = Success<T>;
  const factory ApiResultFirebase.failure(FirebaseException networkExceptions) =
      Failure<T>;
}
