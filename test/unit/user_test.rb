require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "creating user" do
    assert FactoryGirl.create(:user)
  end
end
