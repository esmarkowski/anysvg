require 'sinatra'
require 'net/http'
require 'nokogiri'

class App < Sinatra::Base
  get '/icon' do
    size = params['size'].to_i
    color = params['color']
    service = params['service']
    icon = params['icon']

    # return status 400 unless size

    url = params['url']
    unless url
      return status 400 unless service && icon

      case service
      when 'simpleicons'
        url = "https://simpleicons.org/icons/#{icon}.svg"
      when 'octicon'
        url = "https://github.com/primer/octicons/blob/main/icons/#{icon}.svg"
      else
        return status 400
      end
    end

    begin
      uri = URI(url)
      svg = Net::HTTP.get(uri)

      doc = Nokogiri::XML(svg)
      svg_element = doc.at_css('svg')
      if size
        svg_element['width'] = size.to_s
        svg_element['height'] = size.to_s
      end

      if color
        path_elements = svg_element.css('path')
        path_elements.each { |path_element| path_element['fill'] = "##{color}" }
      end

      content_type 'image/svg+xml'
      doc.to_xml
    rescue => e
      status 500
      e.message
    end
  end
end
