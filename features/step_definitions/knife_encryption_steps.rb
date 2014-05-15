Then(/^the stdout should be one of:$/) do |table|
  latest_chef = "11.12.4"
  # table is a Cucumber::Ast::Table
  data = table.rows_hash
  begin
    puts "unknown Chef version, attempting #{latest_chef} encrypted string"
    data[Chef::VERSION] = data[latest_chef]
  end unless data[Chef::VERSION]

  step("the stdout should contain exactly:", data[Chef::VERSION] ? data[Chef::VERSION] : data["11.12.4"])
end
