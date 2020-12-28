class User < ActiveRecord::Base
    has_many :journal_entries
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
end