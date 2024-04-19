class OrderModel {
late int id;
late int userId;
double? orderAmount;
String? orderStatus;
String? paymentStatus;
String? paymentMethod;
String? confirmed;
String? accepted;
String? scheduled;
String? processing;
String? handover;
String? failed;
String? scheduledAt;
String? orderNote;
double? deliveryCharge;
String? otp;
String? pending;
String? pickedUp;
String? delivered;
String? canceled;
String? createdAt;
String? updatedAt;

double? totalTaxAmout;
String? refundRequested;
String? refunded;
int? detailsCount;

// delivery_address_id
// delivery_address
// transaction_reference;


 OrderModel({
  required this.id,
  required this.userId,
  this.accepted,
  this.canceled, 
  this.confirmed,
  this.createdAt,
  this.delivered,
  this.deliveryCharge,
  this.detailsCount,
  this.failed,
  this.handover,
  this.orderAmount, 
  this.orderNote, 
  this.orderStatus, 
  this.otp,
  this.paymentMethod,
  this.paymentStatus,
  this.pending,
  this.pickedUp,
  this.processing,
  this.refundRequested,
  this.refunded,
  this.scheduled,
  this.scheduledAt,
  this.totalTaxAmout,
  this.updatedAt
});

factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
  id: json['id'],
  userId: json['user_id'],
  accepted: json['accepted'],
  canceled: json['canceled'],
  confirmed: json['confirmed'],
  createdAt: json['created_at'],
  delivered: json['delivered'],
  deliveryCharge: 10.0,
  detailsCount:json['details_count'],
  failed: json['failed'],
  handover: json['handover'],
  orderAmount: json['order_amount'],
  orderNote: json['order_note'],
  orderStatus: json['order_status'],
  otp: json['otp'],
  paymentMethod: json['payment_method'],
  paymentStatus: json['payment_status'],
  pending: json['pending'],
  pickedUp: json['picked_up'],
  processing: json['processing'],
  refundRequested: json['refund_requested'],
  refunded: json['refunded'],
  scheduled: json['scheduled'],
  scheduledAt: json['scheduled_at'],
  totalTaxAmout: 10.0,
  updatedAt: json['updated_at']
  );

Map<String, dynamic> toJson() => {
  'id' : id,
  'user_id' : userId,
  'accepted' :  accepted,
  'canceled' : canceled,
  'confirmed' : confirmed,
  'created_at': createdAt,
  'delivered': delivered,
  'details_count' : detailsCount,
  'failed' : failed,
  'handover' : handover,
  'order_amount' : orderAmount,
  'order_note' : orderNote,
  'order_status' : orderStatus,
  'otp' : otp,
  'payment_method' : paymentMethod,
  'payment_status' : paymentStatus,
  'pending': pending,
  'picked_up': pickedUp,
  'processing' : processing,
  'refund_requested': refundRequested,
  'refunded': refunded,
  'scheduled' : scheduled,
  'scheduled_at' : scheduledAt,
  'updated_at' : updatedAt
};

}

