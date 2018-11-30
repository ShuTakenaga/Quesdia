require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "sqlite3:db/development.db")
end

class User < ActiveRecord::Base
  has_secure_password
  validates :username,
    presence: true
  validates :mail,
    presence: true,
    format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password,
    presence: true,
    length: {in: 4..20}
            
  validates :mail, uniqueness: true

  has_many :favorites
  has_many :ideas, through: :favorites
end

class Idea < ActiveRecord::Base
  has_many :favorites
  belongs_to :category
  has_many :users, through: :favorites
end

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
end

class Category < ActiveRecord::Base
  has_many :ideas
end
