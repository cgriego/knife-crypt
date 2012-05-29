Given /^a knife configuration with en encrypted data bag secret "(.*?)"$/ do |encrypted_data_bag_secret|
  write_file ".chef/encrypted_data_bag_secret", encrypted_data_bag_secret

  write_file ".chef/knife.rb", <<-EOF
    log_level :info
    log_location STDOUT
    node_name ENV['USER']
    client_key "\#{ENV['HOME']}/.chef/\#{ENV['USER']}.pem"
    validation_client_name "chef-validator"
    validation_key "\#{ENV['HOME']}/.chef/chef-validator.pem"
    chef_server_url "https://localhost:4000"
    cache_type 'BasicFile'
    cache_options :path => "\#{ENV['HOME']}/.chef/checksums"

    current_dir = File.dirname(__FILE__)
    cookbook_path ["\#{current_dir}/cookbooks"]
    encrypted_data_bag_secret "\#{current_dir}/encrypted_data_bag_secret"
  EOF
end
