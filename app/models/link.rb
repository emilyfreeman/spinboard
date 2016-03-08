class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true,
                  presence: true
  validates :title, presence: true

  def fetch_summary(params)
    url = params['url']
    Page.get(url).css("meta[name='description']").first.attributes['content'].value
    rescue HTTParty::Error
    rescue StandardError
  end
end
