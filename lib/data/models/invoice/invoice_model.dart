// import 'package:evinote/src/features/features_clinic/screen/history_product/models/order_link_model.dart';
// import 'package:evinote/src/features/features_clinic/screen/history_product/models/order_product/order_product_detail.dart';
// import 'package:evinote/src/features/features_clinic/screen/setting/bloc/staff_management_bloc/staff_model.dart';
// import 'package:evinote/src/shared/models/base_mapper.dart';
// import 'package:flutter/cupertino.dart';
// import '../../../../../../core/util/evi_color.dart';
// import 'order_product/order_product_model.dart';

// class InvoiceModel {
//   int? id;
//   int? clinicId;
//   String? clinicStatus;
//   int? labId;
//   int? orderCode;
//   String? deliveryDate;
//   DateTime? publishDate;
//   DateTime? setDate;
//   int? staffId;
//   int? patitentId;
//   bool? settingStatusFlg;
//   bool? printPatientNameFlg;
//   bool? printTeethImgFlg;
//   List<OrderLinkModel>? orderLinkModel;
//   StaffModel? staff;
//   List<OrderProductModel>? orderProductModel;
//   int? hasDepositeFile;
//   int? hasShadeFile;
//   String? description;

//   InvoiceModel(
//       {this.id,
//       this.clinicId,
//       this.clinicStatus,
//       this.labId,
//       this.orderCode,
//       this.publishDate,
//       this.deliveryDate,
//       this.setDate,
//       this.patitentId,
//       this.settingStatusFlg = false,
//       this.printPatientNameFlg = false,
//       this.printTeethImgFlg = false,
//       this.orderLinkModel,
//       this.staff,
//       this.orderProductModel,
//       this.hasDepositeFile,
//       this.hasShadeFile,
//       this.description});

//   InvoiceModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     clinicId = json['clinic_id'];
//     clinicStatus = json['clinic_status'];
//     labId = json['lab_id'];
//     orderCode = json['order_code'];
//     publishDate = json['publish_at'] != null ? DateTime.parse(json['publish_at']) : null;
//     deliveryDate = json['delivery_date'];
//     setDate = json['set_date'] != null ? DateTime.parse(json['set_date']) : null;
//     staffId = json['staff_id'];
//     patitentId = json['patient_id'];
//     settingStatusFlg = json['setting_status_flg'] ?? false;
//     printPatientNameFlg = json['print_patient_name_flg'] ?? false;
//     printTeethImgFlg = json['print_teeth_image_flg'] ?? false;
//     if (json['OrderLink'] != null) {
//       orderLinkModel = [];
//       json['OrderLink'].forEach((v) {
//         orderLinkModel?.add(OrderLinkModel.fromJson(v));
//       });
//     }
//     clinic = json['Clinic'] != null ? Clinic.fromJson(json['Clinic']) : null;
//     staff = json['Staff'] != null
//         ? StaffModel.fromJson(json['Staff'] is Map<String, dynamic> ? json['Staff'] : (json['Staff']).toJson())
//         : null;
//     staff = json['Plasterer'] != null
//         ? StaffModel.fromJson(
//             json['Plasterer'] is Map<String, dynamic> ? json['Plasterer'] : (json['Plasterer']).toJson())
//         : null;
//     if (json['OrderProduct'] != null) {
//       orderProductModel = [];
//       json['OrderProduct'].forEach((v) {
//         orderProductModel
//             ?.add(OrderProductModel.fromJson(v is Map<String, dynamic> ? v : (v as OrderProductModel).toJson()));
//       });

//       if (orderProductModel!.isNotEmpty) {
//         orderProductModel?.forEach((element) {
//           element.orderLinkModel = orderLinkModel;
//         });
//       }
//     }
//     patient = json['Patient'] != null ? Patient.fromJson(json['Patient']) : null;
//     lab = json['Lab'] != null ? Lab.fromJson(json['Lab']) : null;
//     appointmentModel = json['Appointment'] != null ? AppointmentModel.fromJson(json['Appointment']) : null;

//     has3DFile = json["has3DFile"] ?? 0;
//     hasDepositeFile = json["hasDepositeFile"] ?? 0;
//     hasShadeFile = json["hasShadeFile"] ?? 0;
//     appointmentModel = json['Appointment'] != null ? AppointmentModel.fromJson(json['Appointment']) : null;
//     storageDevices = json['storage_devices'] == null
//         ? []
//         : (json['storage_devices'] as List<dynamic>)
//             .map((e) => StorageDevice.fromJson(e as Map<String, dynamic>))
//             .toList();
//     description = json['description'] ?? '';
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['clinic_id'] = clinicId;
//     data['clinic_status'] = clinicStatus;
//     data['lab_id'] = labId;
//     data['order_date'] = publishDate;
//     data['set_date'] = setDate;
//     data['staff_id'] = staffId;
//     data['patient_id'] = patitentId;
//     data['setting_status_flg'] = settingStatusFlg;
//     data['print_patient_name_flg'] = printPatientNameFlg;
//     data['print_teeth_image_flg'] = printTeethImgFlg;
//     data['Clinic'] = clinic?.toJson();
//     data['Staff'] = staff?.toJson();
//     data['OrderProduct'] = orderProductModel?.map((e) => e.toJson()).toList();
//     data['Lab'] = lab?.toJson();
//     data['delivery_date'] = deliveryDate;
//     data['description'] = description;
//     return data;
//   }

//   bool getRemakeStatus() {
//     var status = false;
//     if (orderProductModel != null) {
//       for (var i in orderProductModel!) {
//         if (i.remake ?? false) {
//           status = true;
//           break;
//         }
//       }
//     }
//     return status;
//   }

//   List<OrderProductDetail> getListOrderProductDetail() {
//     List<OrderProductDetail> result = [];

//     if (orderProductModel != null) {
//       for (var product in orderProductModel!) {
//         if (product.orderProductDetail != null) {
//           for (var productDetail in product.orderProductDetail!) {
//             result.add(productDetail);
//           }
//         }
//       }
//     }
//     return result.toSet().toList();
//   }

//   // List<int> getOrderLink() {
//   //   List<OrderProductDetail> result = getListOrderProductDetail();
//   //   List<int> toothIndex = [];
//   //   for (var ele in result) {
//   //     if (ele.toothIndexId != null) {
//   //       toothIndex.add(ele.toothIndexId!);
//   //     }
//   //   }
//   //   return toothIndex;
//   // }

//   // Map<String, dynamic> toUpdateOrderJson() {
//   //   final Map<String, dynamic> data = <String, dynamic>{};
//   //   if (labId != null) {
//   //     data['lab_id'] = labId;
//   //   }
//   //   data['delivery_date'] = deliveryDate;
//   //   return data;
//   // }

//   // List getProducts() {
//   //   var lstProducts = [];
//   //   if (orderProductModel != null) {
//   //     int size = orderProductModel?.length ?? 0;
//   //     for (var i = 0; i < size; i++) {
//   //       lstProducts.add(orderProductModel?[i]);
//   //     }
//   //   }
//   //   return lstProducts.toSet().toList();
//   // }

//   @override
//   String toString() {
//     return '${toJson()}';
//   }
// }
