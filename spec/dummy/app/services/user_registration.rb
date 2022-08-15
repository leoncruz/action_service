# frozen_string_literal: true

class UserRegistration < ActionService::Base
  attr_accessor :name, :email, :phone

  actions :save_user, :send_welcome_email

  def save_user
    faliure errors: user.errors unless user.save
  end

  def send_welcome_email
    puts "sending welcome email to #{email}"

    success user: user
  end

  private

  def user
    @user ||= User.new(attributes)
  end
end
