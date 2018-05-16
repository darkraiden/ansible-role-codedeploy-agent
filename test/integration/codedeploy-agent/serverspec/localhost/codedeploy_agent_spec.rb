require 'spec_helper'

describe service('codedeploy-agent') do
    it { should be_running }
end
