import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morsl_app_celina0057/data/services/api_services.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/model/feedback_State.dart';

final feedbackprovider = StateNotifierProvider<FeedbackNotifier, FeedbackState>(
  (ref) {
    return FeedbackNotifier();
  },
);

class FeedbackNotifier extends StateNotifier<FeedbackState> {
  FeedbackNotifier() : super(FeedbackState(message: ""));

  Future<void> sendFeedback({
  required String name,
  required String email,
  required String discription,
}) async {
  state = FeedbackState(isLoading: true, message: "", error: "");

  try {
    final payload = {
      "name": name,
      "email": email,
      "description": discription,
    };

    final response = await ApiServices.postRequest(
      url: "https://celina0057backend.signalsmind.com/feedback",
      body: payload,
    );

    if (response["message"] == "Feedback created successfully") {
      state = FeedbackState(
        isLoading: false,
        message: response["message"],
        error: "",
      );
    } else {
      state = FeedbackState(
        isLoading: false,
        message: "",
        error: response["message"] ?? "Something went wrong",
      );
    }
  } catch (e) {
    state = FeedbackState(
      isLoading: false,
      message: "",
      error: "Failed to send feedback. Please try again.",
    );
    debugPrint("Feedback error: $e");
  }
}

}
