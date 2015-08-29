# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :text
#  author_id  :integer          default(0)
#  approved   :boolean          default(TRUE)
#  useragent  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'

  scope :approved, -> { where(:approved => true) }

  validates :text, :useragent, :presence => true
end
