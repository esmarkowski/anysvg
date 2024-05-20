require 'sinatra/base'
require 'net/http'
require 'nokogiri'
require 'logger'

class App < Sinatra::Base

  configure do
    logger = Logger.new(STDOUT)
    STDOUT.sync = true
    set :logger, logger
    set :redis, Redis.new(url: ENV['CACHETOGO_URL'])
  end

  get '/:service/:size/:icon' do
    cache(request.url) do
      size = params['size'].to_i || 16
      service = params['service']
      icon = params['icon']
      color = params['color']

      case service
      when 'si'
        url = "https://simpleicons.org/icons/#{icon}.svg"
      when 'gh'
        # icon_size if size is less 24 use 16 else use 24 unless icon_size parameter is provided
        icon_size = size < 24 ? 16 : 24
        icon_size = params['icon_size'].to_i if params['icon_size']
        url = "https://raw.githubusercontent.com/primer/octicons/main/icons/#{icon}-#{icon_size}.svg"
      when 'bs'
        url = "https://icons.getbootstrap.com/assets/icons/#{icon}.svg"
      else
        return status 400
      end

      generate_svg(url, size, color)
    end
  end

  get '/icon' do
    cache(request.url) do
      size = params['size'].to_i
      url = params['url']
      color = params['color']

      generate_svg(url, size, color)
    end
  end

  def cache(key)
    cached_response = settings.redis.get(key)

    if cached_response
      cached_response
    else
      response = yield
      settings.redis.set(key, response)
      response
    end
  end

  private

  def generate_svg(url, size, color="000000")
    begin
      uri = URI(url)
      svg = Net::HTTP.get(uri)

      doc = Nokogiri::XML(svg)
      svg_element = doc.at_css('svg')
      if size
        svg_element['width'] = size.to_s
        svg_element['height'] = size.to_s
      end

      svg_element['class'] = 'octicon'

      svg_element['fill'] = "##{color}"

      content_type 'image/svg+xml'
      doc.to_xml
    rescue => e
      status 500
      e.message
    end
  end
end