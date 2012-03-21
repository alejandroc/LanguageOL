class User < ActiveRecord::Base
  extend EmailValidator
  #has_secure_password

  validates_presence_of :email, :password, :on => :create
  validates_format_of :email, :with => email_pattern

  scope :active, where(:status => 'active')

  before_create :build_password, :if => lambda { self.password.blank? }

private
  def build_password
    self.password = Digest::MD5.hexdigest( rand( 100000000 ).to_s )
  end

end
