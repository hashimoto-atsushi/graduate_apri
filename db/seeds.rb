#Userデータ
User.create!(
  [
    {
      employee_number: 999,
      name: '管理者',
      department: 2,
      position: 2,
      permission: 'true',
      email: 'admin@example.com',
      cellphone_number: '070070070',
      stay_or_left: 0,
      password: 'adminadmin',
      password_confirmation: 'adminadmin',
    }
  ]
)

User.create!(
  [
    {
      employee_number: 21,
      name: "技術部長",
      department: 1,
      position: 0,
      permission: 'false',
      email: "boss@example.com",
      cellphone_number: "080080888",
      stay_or_left: 0,
      password: 'bossboss',
      password_confirmation: 'bossboss',
    }
  ]
)


10.times do |n|
  User.create!(
    [
      {
        employee_number: n + 1,
        name: "営業部員#{n + 1}",
        department: 0,
        position: 2,
        permission: 'false',
        email: "sales#{n + 1}@example.com",
        cellphone_number: "09009009#{n}",
        stay_or_left: 0,
        password: 'salessales',
        password_confirmation: 'salessales',
      }
    ]
  )
end

10.times do |n|
  User.create!(
    [
      {
        employee_number: n + 11,
        name: "技術部員#{n + 1}",
        department: 1,
        position: 2,
        permission: 'false',
        email: "tech#{n + 1}@example.com",
        cellphone_number: "08008008#{n}",
        stay_or_left: 0,
        password: 'techtech',
        password_confirmation: 'techtech',
      }
    ]
  )
end

#Customerデータ
8.times do |n|
  Customer.create!(
    [
      {
        user_id: n + 3,
        customer_number: n + 1,
        name: "顧客#{n + 1}",
        phone_number: "123123121",
        profession: "業種A#{n + 1}",
        customer_in_charge: "お客様A#{n + 1}",
        department: '技術部',
        position: '一般',
      }
    ]
  )
end

8.times do |n|
  Customer.create!(
    [
      {
        user_id: n + 3,
        customer_number: n + 9,
        name: "顧客#{n + 9}",
        phone_number: "456456456",
        profession: "業種B#{n + 1}",
        customer_in_charge: "お客様A#{n + 9}",
        department: '工作部',
        position: '一般',
      }
    ]
  )
end

4.times do |n|
  Customer.create!(
    [
      {
        user_id: n + 3,
        customer_number: n + 17,
        name: "顧客#{n + 11}",
        phone_number: "456456456",
        profession: "業種B#{n + 1}",
        customer_in_charge: "お客様A#{n + 17}",
        department: '工作部',
        position: '一般',
      }
    ]
  )
end

#Productデータ
20.times do |n|
  Product.create!(
    [
      {
        name: "製品#{n + 1}",
        type_name: "#{n + 100}式",
        category: "加工機器#{n + 1000}",
        list_price: n + 10000,
        release_date: "2010-1-#{n + 1}",
        end_of_production: "2020-1-#{n + 1}",
        end_of_service: "2025-1-#{n + 1}",
      }
    ]
  )
end
#Partsデータ
20.times do |n|
  Part.create!(
    [
      {
        name: "保守パーツ#{n + 1}",
        type_name: "#{n + 1}PTS型",
        category: "ユニット#{n + 1000}式",
        list_price: n + 200,
        stock: 30,
        release_date: "2017-2-#{n + 1}",
        end_of_production: "2024-1-#{n + 1}",
        end_of_service: "2027-1-#{n + 1}",
      }
    ]
  )
end
#Installed_products
  5.times do |n|
    InstalledProduct.create!(
      [
        {
          product_id: n + 1,
          customer_id: n + 1,
          serial_number: n + 11111,
          installed_date: "2015-1-#{n + 1}",
          discount_price: 3000,
        }
      ]
    )
end

5.times do |n|
  InstalledProduct.create!(
    [
      {
        product_id: n + 5,
        customer_id: n + 5,
        serial_number: n + 22222,
        installed_date: "2017-7-#{n + 1}",
        discount_price: 5000,
      }
    ]
  )
end

5.times do |n|
  InstalledProduct.create!(
    [
      {
        product_id: n + 10,
        customer_id: n + 10,
        serial_number: n + 33333,
        installed_date: "2019-9-#{n + 1}",
        discount_price: 7000,
      }
    ]
  )
end

5.times do |n|
  InstalledProduct.create!(
    [
      {
        product_id: n + 15,
        customer_id: n + 15,
        serial_number: n + 44444,
        installed_date: "2016-6-#{n + 1}",
        discount_price:1500,
      }
    ]
  )
end
