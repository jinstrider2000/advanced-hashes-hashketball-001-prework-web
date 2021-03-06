# Write your code here!
#Player Stats: {number:, shoe:, points:, rebounds:, assists:, steals:, blocks:, slam_dunks:}
require "pry"
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets", colors: ["Black","White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {
      team_name: "Charlotte Hornets", colors: ["Turquoise","Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end

def num_points_scored(player_name)
  points = nil
  game_hash.each_value do |team_info|
    team_info.each_value do |data|
      if data.is_a? Hash
        data.each do |name,stats|
          if name == player_name
            points = stats.fetch(:points)
            break
          end
        end
      end
    end
  end
  points
end

def shoe_size(player_name)
  shoe_size = nil
  game_hash.each_value do |team_info|
    team_info.each_value do |data|
      if data.is_a? Hash
        data.each do |name,stats|
          if name == player_name
            shoe_size = stats.fetch(:shoe)
            break
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  colors =[]
  game_hash.each_value do |team_info|
    if team_info[:team_name] == team_name
      colors = team_info[:colors]
    end
  end
  colors
end

def team_names
  names =[]
  game_hash.each_value {|team_info| names << team_info[:team_name]}
  names
end

def player_numbers(team_name)
  team_nums =[]
  game_hash.each_value do |team_info|
    if team_info[:team_name] == team_name
      team_info.each_value do |data|
        if data.is_a? Hash
          data.each_value {|stats| team_nums << stats.fetch(:number)}
        end
      end
    end
  end
  team_nums
end

def player_stats(player_name)
  
  ind_stats = nil

  game_hash.each_value do |team_info|
    team_info.each_value do |stats|
      if stats.is_a? Hash
        if stats.assoc(player_name)
          ind_stats = stats.assoc(player_name)
        end
      end
    end
  end
  ind_stats[1]
end

def big_shoe_rebounds
  biggest_shoe = nil
  rebounds = nil
  game_hash.each_value do |team_info|
    team_info.each_value do |attribute|
      if attribute.is_a? Hash
        attribute.each_value do |stats|
          if !biggest_shoe || (biggest_shoe && biggest_shoe < stats[:shoe])
            biggest_shoe = stats[:shoe]
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end









