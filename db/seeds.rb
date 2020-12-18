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
        customer_in_charge: "お客#{n + 1}様",
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
        customer_in_charge: "お客様#{n + 9}様",
        department: '設備管理部',
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
        name: "顧客#{n + 17}",
        phone_number: "456456456",
        profession: "業種B#{n + 1}",
        customer_in_charge: "お客様#{n + 17}様",
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
        release_date: "2021-1-#{n + 1}",
        end_of_production: "2025-1-#{n + 1}",
        end_of_service: "2027-1-#{n + 1}",
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
        release_date: "2021-1-#{n + 1}",
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
        product_id: n + 6,
        customer_id: n + 6,
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
        product_id: n + 11,
        customer_id: n + 11,
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
        product_id: n + 16,
        customer_id: n + 16,
        serial_number: n + 44444,
        installed_date: "2016-6-#{n + 1}",
        discount_price:1500,
      }
    ]
  )
end

#support_program
10.times do |n|
  SupportProgram.create!(
    [
      {
        customer_id: n + 1,
        user_id: n + 13,
        title_number: n + 1,
        title: "保守案件#{n + 1}",
        main_work: "パーツの交換です#{n + 1}",
        planed_or_argent: 0,
        order_status: true,
        kick_off_date: "2021-1-#{n + 1}",
        closed: 0,
      }
    ]
  )
end
10.times do |n|
  SupportProgram.create!(
    [
      {
        customer_id: n + 11,
        user_id: n + 13,
        title_number: n + 11,
        title: "保守案件#{n + 11}",
        main_work: "電源ユニットの交換です#{n + 11}",
        planed_or_argent: 1,
        order_status: false,
        kick_off_date: "2021-1-#{n + 11}",
        closed: 0,
      }
    ]
  )
end

#detail_report
10.times do |n|
  DetailReport.create!(
    [
      {
        support_program_id: n + 1,
        ordered_date: "2019-12-#{n + 1}",
        ordered_price: 2000 + n,
        actual_kickoff_date: "2020-01-#{n + 1}",
        actual_complete_date: "2019-01-#{n + 10}",
        service_detail: "パーツの交換作業#{n + 1}",
        results: "問題無く全工程を終了#{n + 1}",
        evaluation: 0,
        evaluation_details: "お客様も安心して立ち会っていただき、最終動作も満足していただきました#{n + 1}。",
      }
    ]
  )
end
10.times do |n|
  DetailReport.create!(
    [
      {
        support_program_id: n + 11,
        ordered_date: "2019-11-#{n + 1}",
        ordered_price: 4000 + n,
        actual_kickoff_date: "2020-02-#{n + 1}",
        actual_complete_date: "2020-02-#{n + 20}",
        service_detail: "電源ユニットの交換作業#{n + 1}",
        results: "一部、部品に不良があり、別電源ユニットで対応しました#{n + 1}。",
        evaluation: 1,
        evaluation_details: "作業時間が延びてしまったことに関して、ご指摘をうけました#{n + 1}。",
      }
    ]
  )
end

#boss_check_comment
10.times do |n|
  BossCheckComment.create!(
    [
      {
        detail_report_id: n + 1,
        confirmation: true,
        confirmation_date: "2021-02-#{n + 1}",
        positive_comment: "無事に作業終了ありがとうごいました#{n + 1}。",
        negative_comment: "特にありませんが、報告をもう少し早めにお願いします#{n + 1}。",
        assistance: "この調子でよろしくお願いします#{n + 1}。",
        questions: "特にありません#{n + 1}。",
        report_to_sales: "営業さん、問題無く全工程を終了しました#{n + 1}。",
      }
    ]
  )
end
10.times do |n|
  BossCheckComment.create!(
    [
      {
        detail_report_id: n + 11,
        confirmation: true,
        confirmation_date: "2021-02-#{n + 11}",
        positive_comment: "了解です。不良部品の検査をお願いします#{n + 11}。",
        negative_comment: "できるだけ、動作確認をして、先方にはきちんと原因の説明をさしあげましょう#{n + 11}。",
        assistance: "今後は、持ち出し時に、動作確認をお願いします#{n + 11}。",
        questions: "営業には私から連絡しておきますが、いいですか？ 明日までに私に声をかけてください#{n + 11}。",
        report_to_sales: "営業さん、保守パーツに初期不良がありました。先方への対応、相談させてください#{n + 1}。",
      }
    ]
  )
end

# sales_check_comment
10.times do |n|
  SalesCheckComment.create!(
    [
      {
        boss_check_comment_id: n + 1,
        confirmation: true,
        confirmation_date: "2021-02-#{n + 5}",
        comments: "報告ありがとうございまいた。明日にでも先方に挨拶に伺いします#{n + 1}。",
        discussion_possibility: false,
        matter_closed: true,
      }
    ]
  )
end
10.times do |n|
  SalesCheckComment.create!(
    [
      {
        boss_check_comment_id: n + 11,
        confirmation: true,
        confirmation_date: "2021-02-#{n + 15}",
        comments: "了解です。正確なご報告ありがとうございます。一度、先方への説明を含め相談させてください#{n + 1}。",
        discussion_possibility: true,
        matter_closed: true,
      }
    ]
  )
end
