# command_parser_spec.rb - specs for command_parser

require_relative 'spec_helper'

describe CommandParser do
  describe 'single command: init' do
    before do
      ARGV.clear; ARGV << 'init'
      @init_found = false
      @parser = CommandParser.new() do |command|
      command.on('init', 'Initializes the project') do 
        @init_found = true
    end
    end

    @parser.parse!
    end


    specify { @init_found.must_equal true }
  end

  describe 'unknown command' do
    before do
      ARGV.clear; ARGV << 'run'
      @parser = CommandParser.new() do |command|
        command.on('init', 'Initializes')
      end
  end

    specify { 
      assert_raises(CommandParser::CommandNotFound) do
      @parser.parse!
      end
    }
  end
end
