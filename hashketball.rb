# Write your code here!

require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [{
        name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      {
        name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      {
        name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      {
        name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      {
        name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{
        name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      {
        name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10
      },
      {
        name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      {
        name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      {
        name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12
      }
      ]
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    p "We have data on the #{location.to_s} team!"
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def num_points_scored(name)
  points_scored = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:name] == name
        p player
        points_scored = player[:points]
      end
    end
  end
  points_scored
end

def shoe_size(name)
  shoe_size = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:name] == name
        p player
        shoe_size = player[:shoe]
      end
    end
  end
  shoe_size
end


def team_colors(team_name)
  team_colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_colors = team_data[:colors]
    end
  end
  team_colors
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_names.push(team_data[:team_name])
  end
  team_names
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player|
        player_numbers.push(player[:number])
      end
    end
  end
  
  player_numbers
end

def player_stats(name)
  stats_hash = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:name] == name
        player.each do |stat, stat_data|
          if stat != :name
            stats_hash[stat] = stat_data
          end
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  big_shoe_rebounds = 0
  big_shoe_player = {}
  biggest_shoe_so_far = 0
  
  #finds the biggest shoe and the player with it
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > biggest_shoe_so_far
        biggest_shoe_so_far = player[:shoe]
        big_shoe_player = player
      end
    end
  end
  big_shoe_rebounds = big_shoe_player[:rebounds]
end

def most_points_scored
  most_points_player = ""
  most_points_so_far = 0
  
  #finds the most points scored and the player's name
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:points] > most_points_so_far
        most_points_so_far = player[:points]
        most_points_player = player[:name]
      end
    end
  end
  most_points_player
end


def winning_team
  scoreline = {}
  
  game_hash.each do |location, team_data|
    team_points = 0
    team_data[:players].each do |player|
      team_points += player[:points]
    end
    scoreline[team_data[:team_name]] = team_points
  end
  
  winning_team = scoreline.max_by {|team_name, team_points| team_points}[0]
  
end

def player_with_longest_name
  player_with_longest_name = ""
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:name].length > player_with_longest_name.length
        player_with_longest_name = player[:name]
      end
    end
  end
  player_with_longest_name
end

def player_with_most_steals
  player_with_most_steals = ""
  most_steals_so_far = 0
  
  #finds the most steals and the player's name
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:steals] > most_steals_so_far
        most_steals_so_far = player[:steals]
        player_with_most_steals = player[:name]
      end
    end
  end
  player_with_most_steals
end  

def long_name_steals_a_ton?
  player_with_longest_name == player_with_most_steals
end
