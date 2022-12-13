# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js.erb, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( welcome.js welcome.css )
Rails.application.config.assets.precompile += %w( coins.js coins.css )
Rails.application.config.assets.precompile += %w( mining_types.js mining_types.css )
Rails.application.config.assets.precompile += %w( devise/confirmations.js devise/confirmations.css )
Rails.application.config.assets.precompile += %w( devise/mailer.js devise/mailer.css )
Rails.application.config.assets.precompile += %w( devise/passwords.js devise/passwords.css )
Rails.application.config.assets.precompile += %w( devise/registrations.js devise/registrations.css )
Rails.application.config.assets.precompile += %w( devise/sessions.js devise/sessions.css )
Rails.application.config.assets.precompile += %w( devise/shared.js devise/shared.css )
Rails.application.config.assets.precompile += %w( devise/unlocks.js devise/unlocks.css )