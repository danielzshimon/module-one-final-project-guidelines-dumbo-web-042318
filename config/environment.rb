require 'bundler'
Bundler.require
require 'open-uri'
require 'XmlSimple'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger=nil
require_all 'lib'
