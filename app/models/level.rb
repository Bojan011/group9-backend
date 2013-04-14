# == Schema Information
#
# Table name: levels
#
#  id         :integer          not null, primary key
#  name       :integer
#  xp         :integer
#  health     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Level < ActiveRecord::Base
  attr_accessible :name,:xp, :health

  validates :name,    :presence   => true,
                      :uniqueness => { :case_sensitive => false }
  validates :xp,      :presence   => true
  validates :health,  :presence => true
end
