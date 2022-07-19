RSpec.shared_context "clean up test folders after group" do
  after(:all) do
    FileUtils.rm_rf("./easy")
    FileUtils.rm_rf("./medium")
    FileUtils.rm_rf("./hard")
  end
end
