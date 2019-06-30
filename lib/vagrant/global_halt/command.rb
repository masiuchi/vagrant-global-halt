require 'optparse'

module Vagrant
  module GlobalHalt
    class Command < Vagrant.plugin('2', :command)
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

        active_machine_entries = @env.machine_index.find_all do |entry|
          entry.state.to_s == 'running' && entry.valid?(@env.home_path)
        end

        if active_machine_entries.empty?
          @env.ui.info('No running VM.')
          return 0
        end

        active_machine_entries.each do |entry|
          machine_info = "id: #{entry.id.to_s}, name: #{entry.name.to_s}, provider: #{entry.provider.to_s}, directory: #{entry.vagrantfile_path.to_s}"
          @env.ui.info(machine_info)

          with_target_vms(entry.id.to_s) do |vm|
            vm.action(:halt, force_halt: options[:force])
          end;
        end

        0
      end
    end
  end
end

