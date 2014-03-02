###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

item_pages = [
  { name: "music", title: "Music" },
  { name: "bluray", title: "Blu-ray" },
  { name: "book", title: "Book" },
  { name: "figure", title: "figure" },
  { name: "other", title: "Other" }
]

item_pages.each do |item_page|
  proxy "#{item_page[:name]}.html", "/template/item.html", locals: { item: item_page[:name], title: item_page[:title] }, ignore: true
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash, :ignore => %r{^images/member/.*}

  # Use relative URLs
  activate :relative_assets

  activate :minify_html , remove_http_protocol: false

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

after_configuration do
  sprockets.append_path File.join root, 'vendor/bower_components'
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'gh-pages'
end

