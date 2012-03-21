class User < ActiveRecord::Base
  extend EmailValidator

  validates_presence_of :email, :password
  validates_format_of :email, :with => email_pattern

  scope :active, where(:status => 'active')

  before_create :build_password, :if => lambda { self.password.blank? }

private
  def build_password
    self.password = Digest::MD5.hexdigest( rand( 100000000 ).to_s )
  end

end
