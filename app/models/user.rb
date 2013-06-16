class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :password, :password_confirmation
  
  validates_presence_of :email, :full_name
  validates_confirmation_of :password
  
  validates :email, 
    :presence => true, 
    :uniqueness => { :case_sensitive => false },
    :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
  
  has_secure_password  
  before_create :generate_token
  
  scope :confirmed, where('confirmed_at IS NOT NULL')
  
  def self.authenticate(email, password)
    confirmed.
      find_by_email(email).
      try(:authenticate, password)
  end

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
    confirmed_at.present?
  end
end
