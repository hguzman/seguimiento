# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
# Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w[devise/sessions.css devise/sessions.js]
Rails.application.config.assets.precompile += %w[devise/registrations.css]
Rails.application.config.assets.precompile += %w[users/anotaciones.css]
Rails.application.config.assets.precompile += %w[ambientes/anotaciones.css]
Rails.application.config.assets.precompile += %w[admin/ambientes.css]
Rails.application.config.assets.precompile += %w[admin/fichas.css]
Rails.application.config.assets.precompile += %w[devise/sessions.css devise/sessions.js]
Rails.application.config.assets.precompile += %w[devise/registrations.css]
Rails.application.config.assets.precompile += %w[users/anotaciones.css]
Rails.application.config.assets.precompile += %w[admin/ambientes.css]
Rails.application.config.assets.precompile += %w[admin/especialidades.css]
Rails.application.config.assets.precompile += %w[admin/tipo_documentos.css]
Rails.application.config.assets.precompile += %w[admin/users.css]
Rails.application.config.assets.precompile += %w[devise/passwords.css]
Rails.application.config.assets.precompile += %w[anotaciones/comentarios.css]
