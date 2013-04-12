class BattleController < ApplicationController
	def calculate
		if params[:attacker] && params[:defender]

			attacker = User.find(params[:attacker])
			defender = User.find(params[:defender])
			# 5 rounds of game
			round_results = []
			if attacker.health.to_i > 0 && defender.health.to_i > 0
				5.times do

					# playing game and result will be 0(loose) or 1(win)
					play_result = rand(10..100)%2
					puts "RESULT : #{play_result}"
					# if won
					if play_result == 1
						puts "Attacker won"
						winner = won_player(attacker)
						lose_stat = lose_player(defender,attacker.strength)
					#if loose
					else
						puts "defender won"
						winner = won_player(defender)
						lose_stat = lose_player(attacker,defender.strength)
					end
					round_results << { "won_player_name"=>winner.name,"won_player_level"=>winner.level,"loser_level"=>lose_stat["level"],"damage" => lose_stat["damage"],"loser_health"=>lose_stat["health"]}

					puts "ATTACKER"
					puts "=============="
					puts attacker.inspect
					puts "DEFENDER"
					puts "=============="
					puts defender.inspect
					if lose_stat["health"] <= 0
						puts "game over"
						#render :text=>"GAME OVER" and return
						break
					end
				end
			end
			render :json=>round_results.to_json
		else
			render :text=>"Missing Parameters attacker, defender"
		end
	end

	private
	def won_player(user)
		user.experience = user.experience.to_i + 1
		user.xp = user.xp.to_i + 35
		level = Level.where("xp <= #{user.xp}").limit(1).order("xp desc").pluck("name")
		user.level = level[0]
		user.save
		user
	end
	def lose_player(user,winner_strength)
		user.experience = user.experience.to_i + 1
		damage = winner_strength + (rand(10..100)%5)
		user.health = user.health.to_i - damage
		if user.health.to_i > 0
			user.xp = user.xp.to_i + 10
		end
		user.save
		stats = {"health"=>user.health,"damage"=>damage,"level"=>user.level}
		stats
	end
end
