# frozen_string_literal: true

require "native_spec_helper"
require "shared_contexts"

RSpec.describe Functions do
  include_context "in a temporary bundler directory"
  include_context "stub rubygems compact index"

  describe "#jfrog_source" do
    let(:project_name) { "jfrog_source" }

    it "returns the jfrog source" do
      jfrog_source = Functions.jfrog_source(
        dir: tmp_path,
        gemfile_name: "Gemfile",
        credentials: {},
        using_bundler2: true
      )

      expect(jfrog_source).to eq("https://test.jfrog.io/test/api/gems")
    end
  end
end
