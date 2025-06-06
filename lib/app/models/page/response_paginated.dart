import '../../utils/object/object_utils.dart';

import '../code_response.dart';

class ResponsePaginated<T> {
  T? content;
  bool? last;
  int? totalpages;
  int? totalElements;
  int? size;
  int? number;
  String? sort;
  bool? first;
  int? numberOfElements;
  dynamic error;
  dynamic others;
  List? auxList;

  ResponsePaginated(
      {this.content,
      this.error,
      this.last,
      this.totalpages,
      this.totalElements,
      this.size,
      this.number,
      this.sort,
      this.first,
      this.numberOfElements,
      this.others, this.auxList});

  factory ResponsePaginated.fromMap(dynamic result, T? content) {
    final map = ObjectUtils.parseToMap(result, defaultValue: {});

    return ResponsePaginated(
      content: content ,
      last: map['last'] as bool,
      totalpages:
          (int.parse(map['totalPages']?.toString() ?? 0.toString())) + 1,
      totalElements:
          int.parse(map['totalElements']?.toString() ?? 0.toString()),
      size: int.parse(map['size']?.toString() ?? 0.toString()),
      number: int.parse(map['number']?.toString() ?? 0.toString()),
      sort: map['sort'] as String,
      first: map['first'] as bool,
      numberOfElements:
          int.parse(map['numberOfElements']?.toString() ?? 0.toString()),
    );
  }

  factory ResponsePaginated.fromMapSimple(T content, {dynamic others}) {
    return ResponsePaginated(content: content , others: others);
  }

  static ResponsePaginated fromSimpleResponse(CodeResponse response) {
    return ResponsePaginated(
        error: response.error == null
            ? null
            : response.error is Map ? response.error["titulo"] : response.error,
        content: response.sucess);
  }
}
