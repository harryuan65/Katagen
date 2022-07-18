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
  it "has a version number" do
    expect(Katagen::VERSION).not_to be nil
  end

  context "with url as input" do
    include_context "clean test folders"

    QUESTIONS.each do |questions|
      it "creates a folder for #{questions[:difficulty]} leet code questions" do
        id, title, difficulty, url = questions.values_at(:id, :title, :difficulty, :url)
        Katagen::SolutionGenerator.perform(url)
        expect(File.directory?("./#{difficulty}/#{id}.#{title}")).to be(true)
      end
    end

    it "raises error when url malformed" do
      expect do
        Katagen::SolutionGenerator.perform("https://leectode.com/prbolem/tws-oum")
      end.to raise_error(/invalid/)
    end
  end

  # context "with question_id as input" do
  #   QUESTIONS.each do |question|
  #     id, title, difficulty, url = question.values_at(:id, :title, :difficulty, :url)
  #     it "creates a folder for question##{id}" do
  #       Katagen::SolutionGenerator.perform(url)
  #       expect(File.directory?("./#{difficulty}/#{id}.#{title}")).to be(true)
  #     end
  #   end

  #   it "raises error when id is out of range" do
  #     expect do
  #       Katagen::SolutionGenerator.perform(123456)
  #     end.to raise_error(/invalid/)
  #   end
  # end

  it "raises error when question does not exist" do
    expect do
      Katagen::SolutionGenerator.perform("https://leetcode.com/problems/fresh_avocado")
    end.to raise_error(/does not exist/)
  end
end
