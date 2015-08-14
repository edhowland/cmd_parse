# version_spec.rb - specs for version

require_relative 'spec_helper'


describe CommandParser::VERSION do
  specify { CommandParser::VERSION.must_be_instance_of String }
end
