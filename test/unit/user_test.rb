require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "creating user" do
    assert FactoryGirl.create(:user)
  end

  test "creating user with no email" do
    assert user = FactoryGirl.build( :user, :email => nil )
    assert !user.valid?
    assert user.errors[:email].include?("can't be blank")
    assert_raise ActiveRecord::RecordInvalid do
      user.save!
    end
  end

  test "creating user with invalid email" do
    assert user = FactoryGirl.build( :user, :email => "foo" )
    assert !user.valid?
    assert user.errors[:email].include?("is invalid")
    assert_raise ActiveRecord::RecordInvalid do
      user.save!
    end
  end

  test "creating user with valid email" do
    assert user = FactoryGirl.build( :user, :email => "foo@bar.com" )
    assert user.valid?
  end

end
