class SubscribedPlan {
  final int? userId;
  final int? planId;

  SubscribedPlan({this.userId, this.planId});

  factory SubscribedPlan.fromJson(Map<String, dynamic> json) => SubscribedPlan(
        userId: json['user_id'],
        planId: json['plan_id'],
      );
}
