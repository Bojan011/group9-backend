# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  health                 :integer          default(100), not null
#  attack                 :integer          default(5), not null
#  defend                 :integer          default(5), not null
#  gender                 :string(255)      default(""), not null
#  dodge                  :integer          default(5), not null
#  experience             :integer          default(0), not null
#  level                  :integer          default(1), not null
#  regen                  :integer          default(0), not null
#  armour                 :integer          default(5), not null
#  charName               :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  strength               :integer          default(5)
#  aim                    :integer          default(5)
#  xp                     :integer          default(0)
#
#Test user
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
