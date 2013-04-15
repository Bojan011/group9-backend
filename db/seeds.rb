# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create stats
# - Level 1 (Base points, see Sec. ): Starting out
# - Level 2 (+10 HP, +2 STR, +2 RGN, +6 Pts):  After 75 XP
# - Level 3 (+15 HP, +3 STR, +2 RGN, +7 Pts):  After 200 XP
# - Level 4 (+25 HP, +4 STR, +1 RGN, +8 Pts):  After 450 XP
# - Level 5 (+45 HP, +5 STR, +2 RGN, +9 Pts):  After 1000 X
Level.create(:name => 1, :xp => 0, :health => 0)
Level.create(:name => 2, :xp => 75, :health => 10)
Level.create(:name => 3, :xp => 200, :health => 15)
Level.create(:name => 4, :xp => 450, :health => 25)
Level.create(:name => 5, :xp => 1000, :health => 46)
puts "Seed data for levels - Done !"