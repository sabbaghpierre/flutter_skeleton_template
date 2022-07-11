class Example {
  late String id;
  late String content;

  Example({required this.id, required this.content});

  Example.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
  }

  Example.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        content = map['content'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    return data;
  }

}
