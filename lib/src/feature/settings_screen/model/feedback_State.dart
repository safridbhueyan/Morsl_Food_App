class FeedbackState {
 final  String? message;
 final  bool? isLoading;
  final String? error;

  FeedbackState({ this.message,
   this.error,
   this.isLoading,
  });

  FeedbackState copyWith(String? message, String? error , bool? isLoading) {
    return FeedbackState(
      message: message ?? this.message,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
