FactoryBot.define do
  factory :purchaserecord_delivery do
    postcode            {'123-1234'}
    deliveryaddress_id  { 2 }
    municipalitids      {'多摩市'}
    address             {'渋谷1-1-1'}
    building            {'たづくり'}
    tel                 {'09012342355'}
    token               {'pk_test_c39cc688a334555a90000000'}
  end
end
