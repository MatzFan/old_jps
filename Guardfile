# frozen_string_literal:true

guard :minitest do
  watch('app.rb') { 'test' }
  watch(%r{^app/(.*)\/(.*)\.rb$}) { 'test' }
  watch(%r{^test/(.*)\/(.*)\.rb$}) { 'test' }
  # watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  # watch(%r{^test/test_helper\.rb$})      { 'test' }
end
