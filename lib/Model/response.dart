// ignore: non_constant_identifier_names
import 'package:cowell/Connection/magento_connection.dart';

class Response {
  Response({
    this.items,
    // this.searchCriteria,
    this.totalCount,
  });
  List<Items> items;
  // SearchCriteria searchCriteria;
  int totalCount;

  factory Response.fromJson(Map<String, dynamic> json) {
    final jsonItems = json['items'] as List;
    List<Items> lstItem = jsonItems.map((e) => Items.fromJson(e)).toList();
    return Response(
      items: lstItem,
      totalCount: json['total_count'],
    );
  }
}

// class SearchCriteria {}

class Items {
  Items({
    this.id,
    this.sku,
    this.name,
    this.attributeSetId,
    this.price,
    this.status,
    this.visibility,
    this.typeId,
    this.createAt,
    this.updateAt,
    this.weight,
  });
  final int id;
  final String sku;
  final String name;
  final Future<AttributeSet> attributeSetId;
  final int price;
  final int status;
  final int visibility;
  final String typeId;
  final String createAt;
  final String updateAt;
  final double weight;

  factory Items.fromJson(Map<String, dynamic> json) {
    Future<AttributeSet> attributeSet = getAttributeSet(json['attribute_set_id']);
    return Items(
        id: json['id'],
        sku: json['sku'],
        name: json['name'],
        attributeSetId: attributeSet,
        price: json['price'],
        status: json['status'],
        visibility: json['visibility']);
  }
}

class AttributeSet {
  AttributeSet({
    this.attributeSetId,
    this.attributeSetName,
    this.sortOrder,
    this.entityTypeId,
  });
  final int attributeSetId;
  final String attributeSetName;
  final int sortOrder;
  final int entityTypeId;

  factory AttributeSet.fromJson(Map<String, dynamic> json) {
    return AttributeSet(
      attributeSetId: json['attribute_set_id'],
      attributeSetName: json['attribute_set_name'],
      sortOrder: json['sort_order'],
      entityTypeId: json['entity_type_id'],
    );
  }
}
