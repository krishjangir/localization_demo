// ApiResponse:-----------------------------------------------------------
class ApiResponse<T> {
  ApiCallState? apiCallState;
  T? data;
  String? message;

  ApiResponse.loading() : apiCallState = ApiCallState.loading;

  ApiResponse.success(this.data) : apiCallState = ApiCallState.success;

  ApiResponse.error(this.message) : apiCallState = ApiCallState.error;

  @override
  String toString() {
    return "ApiCallState : $apiCallState \n Message : $message \n Data : $data";
  }
}

// ApiCallState:-----------------------------------------------------------
enum ApiCallState { loading, success, error }
