guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'cucumber', :cli => "--format pretty" do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }

  watch(%r{^lib/chef/knife/(.+)\.rb}) { |m| "features/#{m[1]}.feature" }
end
