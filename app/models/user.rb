class User < ActiveRecord::Base
    has_many :journal_entries
    has_secure_password
end