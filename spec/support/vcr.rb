require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('12345') { ENV['GITHUB_TOKEN'] }
  c.default_cassette_options = { record: :once, serialize_with: :psych, :preserve_exact_body_bytes => true }
end
