# version_spec.rb - specs for version

require_relative 'spec_helper'


describe CmdParse::VERSION do
  specify { CmdParse::VERSION.must_be_instance_of String }
end
