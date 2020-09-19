#! /usr/bin/env ruby

require "optparse"
require "./lib/factoring_problem.rb"

options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby factorize.rb [options]"

  opts.on("-tNUMBER", "--target NUMBER", Integer, "Target number to factorize") do |t|
    options[:target] = t
  end
  opts.on("-cNUMBER", "--count NUMBER", Integer, "Number of factors needed") do |s|
    options[:count] = s
  end
  opts.on("-mNUMBER", "--max NUMBER", Integer, "Maximum factor size") do |m|
    options[:max] = m
  end
end
parser.parse!

[:target, :count, :max].each do |flag|
  Kernel.abort parser.help if options[flag].nil?
end

p = FactoringProblem.new(**options)

puts p
puts p.solve.to_a
