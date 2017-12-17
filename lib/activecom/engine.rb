require 'font-awesome-rails'
require 'js_cookie_rails'

require 'activecom/view_helpers'

module Activecom
  #
  # Activecom Rails engine allowing to plug this gem into a Rails Application.
  #
  # The engine defines some configuration in order to make it integrating a
  # Rails application smoothly.
  #
  class Engine < ::Rails::Engine
    isolate_namespace Activecom

    # Injects the Activecom view helpers providing the `activecom_tag` helper
    initializer 'activecom.helper' do |app|
      ActionView::Base.send :include, Activecom::ViewHelpers
    end

    initializer 'activecom.assets.precompile' do |app|
      app.config.assets.precompile << %w[
        activecom/messenger.css
        activecom/messenger.js
        activecom.css
      ]
    end
  end
end
