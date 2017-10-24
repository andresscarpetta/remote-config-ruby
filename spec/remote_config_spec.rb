require "spec_helper"

RSpec.describe RemoteConfig do
  it "has a version number" do
    expect(RemoteConfig::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
