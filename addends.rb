#! /usr/bin/env ruby

require "optparse"
require "./lib/summing_problem.rb"

options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby addends.rb [options]"

  opts.on("-tNUMBER", "--target NUMBER", Integer, "Target number") do |t|
    options[:target] = t
  end
  opts.on("-cNUMBER", "--count NUMBER", Integer, "Number of addends needed") do |s|
    options[:count] = s
  end
  opts.on("-mNUMBER", "--max NUMBER", Integer, "Maximum addend size") do |m|
    options[:max] = m
  end
end
parser.parse!

[:target, :count, :max].each do |flag|
  Kernel.abort parser.help if options[flag].nil?
end

p = SummingProblem.new(**options)

puts p
puts p.solve.to_a
