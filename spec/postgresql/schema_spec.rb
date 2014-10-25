require 'spec_helper'

describe Postgresql::Schema do
  it 'has a version number' do
    expect(Postgresql::Schema::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
