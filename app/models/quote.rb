# == Schema Information
#
# Table name: quotes
#
#  id                :integer          not null, primary key
#  trivia            :text
#  author            :string
#  writedate         :datetime
#  link              :string
#  approver_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  bioreactor_reason :string
#  state             :string           default("pending")
#

class Quote < ActiveRecord::Base
  scope :passed, -> { where(:state => 'approved') }
  scope :awaiting, -> { where(:state => 'pending') }
  scope :deleted, -> { where(:state => 'bioreactored') }
  belongs_to :approver, :class_name => User

  validates :trivia, :author, :writedate, :link, :presence => true

  state_machine initial: :pending do
    event :approve do
      transition :pending => :approved
    end

    event :bioreactor do
      transition :pending => :bioreactored
    end
  end
end
