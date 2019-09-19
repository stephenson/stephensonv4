# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

require 'bootstrap'

import_file File.expand_path("_headers", config[:source]), "/_headers"

activate :directory_indexes
activate :gzip
activate :sprockets
activate :livereload

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :blog do |blog|
  blog.prefix = ""
  blog.layout = "blog_article"
  blog.permalink = "{title}"
  blog.summary_separator = /SPLIT_SUMMARY_BEFORE_THIS/
  blog.paginate = true
  blog.page_link = "page-{num}"
  blog.per_page = 5
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/legal.html", :layout => "legal"
page "/legal/*", :layout => "legal"

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :asset_hash
end

configure :development do
  config[:host] = "http://localhost:4567"
end

configure :build do
  config[:host] = "https://www.stephenson.dk"
end

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
