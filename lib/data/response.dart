class WitResponse {
  String query;
  List<WitEntity> entities;

  WitResponse({this.query, this.entities});

  factory WitResponse.fromJson(Map<String, dynamic> json) {
    var list = json['entities']['"wit\$local_search_query:local_search_query"'] as List;
    List<WitEntity> entities = list.map((i) => WitEntity.fromJson(i)).toList();
    return new WitResponse(
      query: json['query'],
      entities: entities
    );
  }
}

class WitEntity {
  String body;
  String value;
  String type;
  double confidence;
  bool suggested;

  WitEntity({this.body, this.value, this.type, this.confidence, this.suggested});

  factory WitEntity.fromJson(Map<String, dynamic> json) {
    return new WitEntity(
      body: json['body'],
      value: json['value'],
      type: json['type'],
      confidence: json['confidence'],
      suggested: json['suggested']
    );
  }
}