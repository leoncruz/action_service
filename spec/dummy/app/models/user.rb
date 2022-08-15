# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, :phone, presence: true
end
