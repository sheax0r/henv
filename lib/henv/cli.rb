require "clamp"
require "json"
require "shellwords"

module Henv
  module Config
    def config
      JSON.parse(config_command_result)
    end

    def config_command
      "heroku config -a #{app} --json"
    end

    def config_command_result
      `#{config_command}`.tap do
        fail("Failed to execute command: #{config_command}") unless $?.exitstatus.zero?
      end
    end
  end

  class ExportCommand < Clamp::Command
    include Config

    parameter "APP", "app", attribute_name: :app

    def execute
      config.each do |k,v|
        puts "export #{k}=$'#{v.gsub("'", "\\\\'").gsub("\n", "\\n")}'"
      end
    end
  end

  class ExecCommand <  Clamp::Command
    include Config
    parameter "APP", "app", attriubte_name: :app
    parameter "COMMAND ...", "command", attribute_name: :command
    def execute
    end
  end

  class CLI < Clamp::Command
    subcommand "export", "Print EXPORT commands. Useful with eval.", ExportCommand
    subcommand "exec", "Execute a subcommand.", ExecCommand
  end

end
