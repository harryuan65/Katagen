# frozen_string_literal: true

LEETCODE_QUESTIONS = [
  {
    id: "1",
    title: "two-sum",
    difficulty: "easy"
  },
  {
    id: "2",
    title: "add-two-numbers",
    difficulty: "medium"
  },
  {
    id: "4",
    title: "median-of-two-sorted-arrays",
    difficulty: "hard"
  }
].freeze

RSpec.describe Katagen do
  it "has a version number" do
    expect(Katagen::VERSION).not_to be nil
  end

  include_context "clean up test folders"

  LEETCODE_QUESTIONS.each do |questions|
    it "creates a folder for #{questions[:difficulty]} leet code questions" do
      id, title, difficulty = questions.values_at(:id, :title, :difficulty)
      Katagen::Command.leetcode(id)
      expect(File.directory?("./#{difficulty}/#{id}.#{title}")).to be(true)
    end
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
