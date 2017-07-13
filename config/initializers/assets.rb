# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( photoswipe.min.js )
Rails.application.config.assets.precompile += %w( photoswipe-ui-default.min.js )
Rails.application.config.assets.precompile += %w( fotos.js )
# Rails.application.config.assets.precompile += %w( presente.js )
Rails.application.config.assets.precompile += %w( confirmations.js )
Rails.application.config.assets.precompile += %w( jquery.stickyfooter.min.js )
Rails.application.config.assets.precompile += %w( adjust_page_height.js )
#Rails.application.config.assets.precompile += %w( slick.min.js )
Rails.application.config.assets.precompile += %w(*.svg *.eot *.woff *.ttf *.gif *.png *.ico)
#config.assets.precompile += %w( .js .css *.css.scss .svg .eot .woff .ttf)
