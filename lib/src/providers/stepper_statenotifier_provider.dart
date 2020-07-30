import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

class StepperStateNotifierProvider extends StateNotifier<int> {
  StepperStateNotifierProvider([int state]) : super(0);

  int initialValue() => state;
  void onStepTap(int step, int lengthStepper) {
    state = step;
  }

  void onStepContinue(int lengthStepper, {Function() onDone}) {
    if (state < lengthStepper - 1) {
      state = state + 1;
    } else {
      onDone();
    }
  }

  void onStepCancel({Function() onLastCancel}) {
    if (state > 0) {
      state = state - 1;
    } else {
      state = 0;
      onLastCancel();
    }
  }
}

final stepperStateNotifierProvider = StateNotifierProvider(
  (ref) => StepperStateNotifierProvider(),
);
