class ApiResponse<T> {
  ApiResponse({
    this.data,
    this.error,
    this.message,
    this.count,
  });

  T data;
  bool error;
  String message;
  int count;
}
