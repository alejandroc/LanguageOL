FactoryGirl.define do

  factory :user do
    email    'foo@bar.com'
    password '123'
    type     'foo'
    status   'active'
  end

end
