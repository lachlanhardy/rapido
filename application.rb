require 'rubygems'
require 'sinatra'
require 'net/http'
require 'pp' # only for dev work

module Application
  
  class App # < Sinatra::Application
    Dir.glob("lib/helpers/*").each do |helper|
      require "#{File.dirname(__FILE__)}/#{helper}"
    end

    helpers do
      include Application::Helpers
    end
    
    configure do
      # nil
    end

    error do
      handle_fail
    end

    not_found do
      handle_fail
    end
    
    # homepage
    get '/' do
      erb :index
    end

    get '/:page/' do 
      @page = params[:page]
      erb @page.to_sym
    end
  end
end
