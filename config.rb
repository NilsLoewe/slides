# Page options, layouts, aliases and proxies

set :markdown_engine, :redcarpet
set :haml, { :ugly => true, :format => :html5 }

# Per-page layout changes:
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/*.html", layout: :layout

configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :deploy do |deploy|
  deploy.deploy_method   = :sftp
  deploy.host            = 'nils-loewe.de'
  deploy.port            = 22
  deploy.path            = '/var/www/slides.nils-loewe.de'
  deploy.flags           = '-avz --chown=www-data:www-data'
  deploy.user            = 'nils'
end
