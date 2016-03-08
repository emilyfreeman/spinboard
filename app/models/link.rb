class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true,
                  presence: true
  validates :title, presence: true
end
