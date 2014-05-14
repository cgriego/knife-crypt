Then(/^the stdout should be one of:$/) do |table|
  # table is a Cucumber::Ast::Table
  data = table.rows_hash
  step "the stdout should contain exactly:", data[Chef::VERSION]
end
