require 'vagrant'

module Vagrant
  module GlobalHalt
    class Plugin < Vagrant.plugin('2')
      name 'global-halt command'
      description <<-DESC
      The `global-halt` command shuts your all virtual machines down forcefully.
      DESC
    
      command 'global-halt' do
        require File.expand_path('../command', __FILE__)
        Command
      end
    end
  end
end

