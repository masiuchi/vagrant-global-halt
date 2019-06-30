require 'optparse'

module Vagrant
  module GlobalHalt
    class Command < Vagrant.plugina('2', :command)
      def self.synopsis
        'stops all vagrant machines'
      end

      def execute
        options = {}
        options[:force] = false

        opts = OptionParser.new do |o|
          o.banner = 'Usage: vagrant global-halt [options]'
          o.separator ''
          o.separator 'Options:'
          o.separator ''

          o.on('-f', '--force', 'Force shut down (equivalent of pulling power)') do |f|
            options[:force] = f
          end
        end

        argv = parse_options(opts)
        return if !argv

        @env.machine_index.each do |entry|
          @logger.debug(entry.name.to_s)
        end

        0
      end
    end
  end
end

