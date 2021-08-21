import 'package:news_application/utility/api/sources.dart';

class SourceResponse {

  String status;
  List<Sources> sources;

	SourceResponse.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		sources = List<Sources>.from(map["sources"].map((it) => Sources.fromJsonMap(it)));


}
