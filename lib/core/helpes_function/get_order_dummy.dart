
import '../../features/get orders/domins/entitys/AddressOrder_entity.dart';
import '../../features/get orders/domins/entitys/order entity.dart';
import '../../features/get orders/domins/entitys/orderProductEntity.dart';
import '../enums/order_enum.dart';

OrderEntity getdummydata() {
  return OrderEntity(
    totalPrice: 150.0,
    uID: 'ORD12345',
    payMethod: 'Paypal',
    status: OrderEnum.pending,
    addressOrderEntity: AddressOrderEntity(
      name: 'John Doe',
      address: '123 Main Street',
      phone: '123-456-7890',
      email: 'johndoe@example.com',
      city: 'New York',
      addressDetels: 'Apartment 4B',
      
    ),
    orderProductEntity: [
      OrderproductEntity(
        name: 'Product 1',
        code: 'P001',
        price: 50.0,
        quantity: 1,
        Urlimage: 'https://plus.unsplash.com/premium_photo-1671379041175-782d15092945?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      OrderproductEntity(
        name: 'Product 2',
        code: 'P002',
        price: 100.0,
        quantity: 2,
        Urlimage: 'https://plus.unsplash.com/premium_photo-1671379041175-782d15092945?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      OrderproductEntity(
        name: 'Product 3',
        code: 'P003',
        price: 100.0,
        quantity: 2,
        Urlimage: 'https://plus.unsplash.com/premium_photo-1671379041175-782d15092945?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),



    ], 
  );
}
