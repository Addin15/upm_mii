import 'package:upm_mii/models/insurance_plan.dart';

class SubscribedPlan {
  final int? userId;
  final int? planId;
  final InsurancePlan? insurancePlan;

  SubscribedPlan({this.userId, this.planId, this.insurancePlan});

  factory SubscribedPlan.fromJson(Map<String, dynamic> json) => SubscribedPlan(
        userId: json['user_id'],
        planId: json['plan_id'],
        insurancePlan: InsurancePlan.fromJson(json),
      );
}
