part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable{
  const AuthState();
  @override

  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}





// Forgot Password specific states
class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {
  final String message;
  const ForgotPasswordSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ForgotPasswordError extends AuthState {
  final String error;
  const ForgotPasswordError(this.error);

  @override
  List<Object?> get props => [error];
}

// SignUp States
class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final User user;
  const SignUpSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class SignUpError extends AuthState {
  final String error;
  const SignUpError(this.error);

  @override
  List<Object?> get props => [error];
}

// SignIn States
class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  final User user;
  const SignInSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class SignInError extends AuthState {
  final String error;
  const SignInError(this.error);

  @override
  List<Object?> get props => [error];
}

class SignInWithGoogleLoading extends AuthState {}

class SignInWithGoogleSuccess extends AuthState {
  final User user;
  const SignInWithGoogleSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class SignInWithGoogleError extends AuthState {
  final String error;
  const SignInWithGoogleError(this.error);

  @override
  List<Object?> get props => [error];
}
class SignOutLoading extends AuthState {}
class SignOutSuccess extends AuthState {}
class SignOutError extends AuthState {
 final String message;

 const SignOutError(this.message);
}