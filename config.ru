require "rack"
require "rack/contrib/try_static"
require 'rack/cache'

# Enable proper HEAD responses
use Rack::Head

# Caching
use Rack::Cache,
    :verbose     => true,
    :metastore   => 'file:/var/cache/rack/meta',
    :entitystore => 'file:/var/cache/rack/body'


# Add basic auth if configured
if ENV["HTTP_USER"] && ENV["HTTP_PASSWORD"]
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == [ENV["HTTP_USER"], ENV["HTTP_PASSWORD"]]
  end
end

# Forces SSL on all requests
unless ENV['RACK_ENV'] == 'development'
  require 'rack/ssl'
  use Rack::SSL
end


ONE_WEEK = 604_800

# Attempt to serve static HTML files
use Rack::TryStatic,
  root: 'public',
  urls: %w[/],
  try: %w(.html index.html /index.html),
  header_rules: [
    [
      %w(css svg js png jpg woff),
      { 'Cache-Control' => "public, max-age=#{ONE_WEEK}" },
      %w(html),
      { 'Cache-Control' => "public, max-age=0" }
    ]
  ]

# Serve a 404 page if all else fails
run lambda { |env|
  [
    404,
    {
      "Content-Type" => "text/html",
      "Cache-Control" => "public, max-age=60"
    },
    File.open("build/404/index.html", File::RDONLY)
  ]
}
