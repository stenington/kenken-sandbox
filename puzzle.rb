#! /usr/bin/env ruby

require "optparse"
require "colorize"
require "./lib/summing_problem.rb"
require "./lib/factoring_problem.rb"

options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby puzzle.rb [options]"

  opts.on("-pNUMBER", "--puzzle-size NUMBER", Integer, "Puzzle size") do |m|
    options[:max] = m
  end
end
parser.parse!

[:max].each do |flag|
  Kernel.abort parser.help if options[flag].nil?
end

puzzle_size = options[:max].to_i
puts "+-------- Puzzle size: #{puzzle_size} --------+".yellow

print "> ".blue
while input = gets.chomp
  break if input.empty?

  result = /^(?<operator>[+*xp])(?<target>\d+)(\s+(?<count>\d+))?$/.match(input)
  if result
    case result[:operator]
    when "p"
      puzzle_size = result[:target].to_i
      puts "+-------- Puzzle size: #{puzzle_size} --------+".yellow
      prob = nil
    when "+"
      prob = SummingProblem.new(
        target: result[:target].to_i,
        count: result[:count].to_i,
        max: puzzle_size
      )
    when "*", "x"
      prob = FactoringProblem.new(
        target: result[:target].to_i,
        count: result[:count].to_i,
        max: puzzle_size
      )
    else
      puts "Unknown operator".red
    end

    if prob
      #puts prob.to_s.yellow
      puts input.white
      solutions = prob.solve.to_a
      puts solutions.collect { |s| s.to_s.green }
      puts solutions.inject(Set[]) { |acc, sol| acc.merge(sol.to_a) }.to_a.sort.to_s.cyan
    end
  else
    puts "Unable to parse that".red
  end

  print "> ".blue
end