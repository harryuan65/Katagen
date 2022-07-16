# frozen_string_literal: true

QUESTIONS = [
  {
    id: 1,
    title: "two-sum",
    difficulty: "easy",
    url: "https://leetcode.com/problems/two-sum"
  },
  {
    id: 2,
    title: "add-two-numbers",
    difficulty: "medium",
    url: "https://leetcode.com/problems/add-two-numbers"
  },
  {
    id: 4,
    title: "median-of-two-sorted-arrays",
    difficulty: "hard",
    url: "https://leetcode.com/problems/median-of-two-sorted-arrays"
  }
].freeze

RSpec.describe Katagen do
  let(:example_not_existing_url) { "https://leetcode.com/problems/fresh-avocado/" }

  it "has a version number" do
    expect(Katagen::VERSION).not_to be nil
  end

  QUESTIONS.each do |questions|
    it "creates a folder for #{questions[:difficulty]} leet code questions" do
      id, title, difficulty, url = questions.values_at(:id, :title, :difficulty, :url)
      Katagen::SolutionGenerator.perform!(url)
      expect(File.directory?("./#{difficulty}/#{id}.#{title}")).to be(true)
    end
  end

  after(:all) do
    FileUtils.rm_rf("./easy")
    FileUtils.rm_rf("./medium")
    FileUtils.rm_rf("./hard")
  end
end
