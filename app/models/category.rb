# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  validates_presence_of :title

  has_many :articles, dependent: :destroy

  def self.with_articles
    all.map do |category|
      {
        title: category.title,
        articles: category.articles.includes([:user])
      }
    end
  end

  def self.preview_mode
    all.map do |category|
      {
        title: category.title,
        articles: category.articles.includes([:user]).limit(2)
      }
    end
  end
end
