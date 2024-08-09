# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  category    :string
#  content     :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_user_id      (user_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#  user_id      (user_id => users.id)
#
class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates_presence_of :title, :content, :category
end
