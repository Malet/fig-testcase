#!/usr/bin/env ruby

ITERATIONS = 30
EXPECTED = 'passed'

def test_fig
  puts "Testing #{ITERATIONS} runs with fig:"
  ITERATIONS.times do |n|
    print "\rRun #{n+1} ..."
    result = `fig run test`
    if result.strip != EXPECTED
      raise "\rFailed on run #{n+1}: #{result.inspect} != #{EXPECTED.inspect}"
    end
  end
  puts "\rCompleted #{ITERATIONS} runs"
rescue => e
  print e
end

def test_dockerpty
  api_version = `docker version`.match(/Server API version: (.+)/)[1]
  puts "\n\nTesting #{ITERATIONS} runs with dockerpty:"
  ITERATIONS.times do |n|
    print "\rRun #{n+1} ..."
    result = `DOCKER_SERVER_API_VERSION=#{api_version} ./dpty.py`
    if result.strip != EXPECTED
      raise "\rFailed on run #{n+1}: #{result.inspect} != #{EXPECTED.inspect}"
    end
  end
  puts "\rCompleted #{ITERATIONS} runs"
rescue => e
  print e
end

test_fig
test_dockerpty
