import 'package:flutter/material.dart';

class UserModel {
  String? occupation;
  String? phone;
  String? tax;
  String? name;
  String? id;
  String? account;
  String? image;


  UserModel({this.name,this.occupation,this.phone,this.tax,this.id,this.account,this.image});

  UserModel.fromJson(Map<String,dynamic> json){


    name = json['name'];
    phone = json['phone'];
    occupation = json['occupation'];
    image = json['image'];
    id = json['id'];
    account = json['acount'];
    tax = json['tax'];
    image = json['image'];

  }
}