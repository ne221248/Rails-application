class Member < ApplicationRecord
    has_secure_password

    has_many :orders, dependent: :destroy
    has_one :cart, dependent: :destroy


    attr_accessor :current_password

    validates :password, presence: { if: :current_password },
                         length: { minimum: 4, allow_blank: true }, on: [:create, :update]
    
    validates :name, presence: true, uniqueness: true
    validates :telephone, presence: true,
                          format: {
                            with: /\A[0-9()-]+\z/,
                            allow_blank: true
                          },
                          length: {
                            minimum: 9,
                            maximum: 11,
                            allow_blank: true
                          },
                          uniqueness: {
                            case_sensitive: false,
                            allow_blank: true
                          }

    validates :mail, presence: true, email: { allow_blank: true }
    validates :address, presence: true

end
