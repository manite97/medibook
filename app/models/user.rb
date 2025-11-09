class User < ApplicationRecord
  has_secure_password
  before_validation :set_user_name, on: :create
  before_validation :normalize_phone_number
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  VALID_INDIAN_MOBILE = /\A[6-9]\d{9}\z/
  validates :phone_number, presence: true, format: { with: VALID_INDIAN_MOBILE, message: "must be a valid 10-digit Indian mobile number" }
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  def full_name 
    [first_name, last_name].join(" ")
  end

  private

  def set_user_name
    self.user_name = email if user_name.blank? && email.present?
  end

  # Normalize phone number before validation:
  # - remove non-digit characters
  # - strip leading country code +91 or 91 or leading 0 when present
  # Result stored as 10-digit string
  def normalize_phone_number
    return if phone_number.blank?
    digits = phone_number.to_s.gsub(/\D/, '')
    if digits.length == 12 && digits.start_with?("91")
      digits = digits[-10..-1]
    elsif digits.length == 11 && digits.start_with?("0")
      digits = digits[-10..-1]
    end
    self.phone_number = digits
  end
end
