module Katagen
  #
  # Contains question info to create kata folder, can be extended further.
  #
  class QuestionInfo
    attr_reader :root, :url
    def initialize(root, url)
      @root = root
      @url = url
    end
  end
end
