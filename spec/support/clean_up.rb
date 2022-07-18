RSpec.shared_context "clean up test folders" do
  after do
    FileUtils.rm_rf("./easy")
    FileUtils.rm_rf("./medium")
    FileUtils.rm_rf("./hard")
  end
end
