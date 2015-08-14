# command_parser.rb - class CommandParser

class CommandParser
  class CommandNotFound < RuntimeError
    def initialize command
      super "#{command} is not a recognized command"
    end
  end

  def initialize &blk
  @commands_h = {}
    @descriptions_h = {}

  yield self
  end

def on command, description, &blk
    @descriptions_h[command] = description
    @commands_h[command] = blk
  end

  def parse!
    command = ARGV.shift
    proc_p = @commands_h[command]
    raise CommandNotFound.new(command) unless proc_p.instance_of? Proc
    proc_p.call
  end
end
