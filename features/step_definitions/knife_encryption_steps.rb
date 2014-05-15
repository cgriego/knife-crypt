Then(/^the stdout should be one of:$/) do |table|
  LATEST_CHEF = "11.12.4"
  # table is a Cucumber::Ast::Table
  data = table.rows_hash
  begin
    puts "unknown Chef version, attempting #{LATEST_CHEF} encrypted string"
    data[Chef::VERSION] = data[LATEST_CHEF]
  end unless data[Chef::VERSION]

  step("the stdout should contain exactly:", data[Chef::VERSION] ? data[Chef::VERSION] : data["11.12.4"])
end
