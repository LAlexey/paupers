# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( admin.css admin.js animate.css)
Rails.application.config.assets.precompile += Ckeditor.assets
Rails.application.config.assets.precompile += %w(ru).map {|l| "ckeditor/lang/#{l}.js"}
Rails.application.config.assets.precompile += ['ckeditor/styles.js', 'ckeditor/config.js']
Rails.application.config.assets.precompile += %w( fotorama* )
