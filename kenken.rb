#! /usr/bin/env ruby

require "optparse"
require "./lib/summing_problem.rb"
require "./lib/factoring_problem.rb"

VALID_OPS = %w[ add mult ]

options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby kenken.rb [options]"

  opts.on("-oSTRING", "--operation STRING", "Operation to solve for: #{VALID_OPS.join(", ")}") do |o|
    options[:operator] = o
  end
  opts.on("-tNUMBER", "--target NUMBER", Integer, "Target number") do |t|
    options[:target] = t
  end
  opts.on("-nNUMBER", "--number NUMBER", Integer, "Number of components needed") do |s|
    options[:count] = s
  end
  opts.on("-pNUMBER", "--puzzle-size NUMBER", Integer, "Puzzle size") do |m|
    options[:max] = m
  end
end
parser.parse!

[:operator, :target, :count, :max].each do |flag|
  Kernel.abort parser.help if options[flag].nil?
end

if !VALID_OPS.include?(options[:operator])
  Kernel.abort "Unknown operation: #{options[:operator]}\n\n#{parser.help}"
end

if options[:operator] == 'add'
  p = SummingProblem.new(**options)
elsif options[:operator] == 'mult'
  p = FactoringProblem.new(**options)
end

puts p
puts p.solve.to_a