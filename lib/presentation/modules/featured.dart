
import 'package:json_annotation/json_annotation.dart';

part 'featured.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class Featured{
  final String title;
  final String cover;

  Featured({required this.title,required this.cover});

  //hibernait syntax use keyword for
  factory Featured.fromJson(Map<String, dynamic> json) => _$FeaturedFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedToJson(this);
}