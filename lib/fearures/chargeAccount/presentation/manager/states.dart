

abstract class ChargeAccountStates {}

class InitStateChargeAccount extends ChargeAccountStates{}
class LoadingStateChargeAccount extends ChargeAccountStates{}
class SuccessStateChargeAccount extends ChargeAccountStates{}
class FailureStateChargeAccount extends ChargeAccountStates{
  final String errorMessage;
  FailureStateChargeAccount({required this.errorMessage});
}
