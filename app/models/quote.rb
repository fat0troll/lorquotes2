# == Schema Information
#
# Table name: quotes
#
#  id          :integer          not null, primary key
#  trivia      :text
#  author      :string
#  writedate   :datetime
#  link        :string
#  approved    :boolean          default(FALSE)
#  approver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Quote < ActiveRecord::Base
  scope :passed, -> { where(:approved => true) }
  scope :awaiting, -> { where(:approved => false) }
  belongs_to :approver, :class_name => User

  validates :trivia, :author, :writedate, :link, :approver_id, :presence => true
end
