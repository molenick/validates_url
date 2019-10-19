require 'active_model/validations'

class UserWithAuthority
  include ActiveModel::Validations

  attr_accessor :homepage

  validates :homepage, url: { authority_only: true }
end
