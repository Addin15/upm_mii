import 'package:upm_mii/models/insurance_plan.dart';

class Dummy {
  static get insurancePlans {
    return [
      InsurancePlan(
        id: 0,
        name: '123 Lifee',
        type: 'Life Insurance',
        company: '123',
        description: '...description...',
      ),
      InsurancePlan(
        id: 1,
        name: 'XYZ Car Insurance',
        type: 'Automobile Insurance',
        company: 'XYZ',
        description: '...description...',
      ),
      InsurancePlan(
        id: 2,
        name: 'ABC Health',
        type: 'Health Insurance',
        company: 'ABC',
        description: '...description...',
      ),
    ];
  }
}
