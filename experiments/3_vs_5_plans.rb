ab_test "3 vs 5 plans" do
  description "Testing to see if 3 plans converts better than 5."
  alternatives 3, 5
  metrics :subscriptions
end
