# frozen_string_literal: true

RSpec.describe Katagen do
  let(:id) { "1" }
  let(:title) { "two-sum" }
  let(:difficulty) { "easy" }
  let(:question_root) { "./#{difficulty}/#{id}.#{title}" }
  let(:default_ext) { "rb" }

  it "has a version number" do
    expect(Katagen::VERSION).not_to be nil
  end

  context "with question folder not exist" do
    before { Katagen::Command.leetcode(id) }

    it "creates a folder a leet code questions" do
      expect(File.directory?(question_root)).to be(true)
    end

    it "has a solution file" do
      expect(File.exist?("#{question_root}/solution.#{default_ext}")).to be(true)
    end

    it "has a solution_spec file" do
      expect(File.exist?("#{question_root}/solution_spec.#{default_ext}")).to be(true)
    end

    include_context "clean up test folders after group"
  end

  context "with question folder already exists" do
    before { Katagen::Command.leetcode(id) }

    it "creates an additional solution file" do
      expect do
        Katagen::Command.leetcode(id)
      end.to change { Dir["#{question_root}/solution*.#{default_ext}"].size }.from(2).to(3)
    end

    include_context "clean up test folders after group"
  end

  context "with question id out of range" do
    it "raises error for id < 0" do
      expect do
        Katagen::Command.leetcode("-1")
      end.to raise_error(/is not a valid index/)
    end

    it "raises error when question does not exist" do
      expect do
        Katagen::Command.leetcode("100_000")
      end.to raise_error(/does not exist/)
    end
  end
end
