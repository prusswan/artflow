require 'headless'

headless = Headless.new
at_exit do
  headless.destroy
end

Before("@selenium,@javascript", "~@no-headless") do
  headless.start if Capybara.current_driver == :selenium
end

After("@selenium,@javascript", "~@no-headless") do
  headless.stop if Capybara.current_driver == :selenium
end
