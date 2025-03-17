import 'dart:convert';

class MasjidModel {
  final int? id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final Map<String, dynamic>? contactInfo;
  final String? image;
  final double? distance;

  MasjidModel({
    this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.contactInfo,
    this.image,
    this.distance,
  });

  factory MasjidModel.fromJson(Map<String, dynamic> json) {
    return MasjidModel(
      id: json['id'],
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
      contactInfo: json['contact_info'] is String
          ? jsonDecode(json['contact_info'])
          : json['contact_info'],
      image: json['image'],
      distance: json['distance'] != null
          ? double.parse(json['distance'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'contact_info':
          contactInfo is String ? contactInfo : jsonEncode(contactInfo),
      'image': image,
    };
  }
}
