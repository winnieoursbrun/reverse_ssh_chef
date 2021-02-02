#
# Cookbook:: modulotech
# Spec:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'modulotech::default' do
  context 'When all attributes are default, on Debian 10' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'debian', '10'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
