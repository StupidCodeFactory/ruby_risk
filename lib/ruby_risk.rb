require 'i18n'
require 'ruby_risk/version'
require 'ruby_risk/player'
require 'ruby_risk/game'

module RubyRisk
  I18n.load_path << Dir[File.expand_path('config/locales/*.yml')]
  I18n.available_locales = :en
end
