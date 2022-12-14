FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.free_email }
    password              {'a000000'}
    password_confirmation {password}
    firstname             {'佐藤'}
    lastname              {'太郎'}
    firstnamekana         {'サトウ'}
    lastnamekana          {'タロウ'}
    birth                 {'1987/05/30'}
  end
end