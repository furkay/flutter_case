enum RequestType {
  get,
  post,
  delete,
  put;

  String get toMethodString {
    switch (this) {
      case RequestType.get:
        return 'GET';
      case RequestType.post:
        return 'POST';
      case RequestType.put:
        return 'PUT';
      case RequestType.delete:
        return 'DELETE';
      default:
        return 'GET';
    }
  }
}
