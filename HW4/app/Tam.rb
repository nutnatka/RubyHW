require "erb"

class Pet

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @req = Rack::Request.new(env)
  end

  def response
    case @req.path
    when '/'
      Rack::Response.new(render("form.html.erb"))

    when '/initialize'
      Rack::Response.new do |response|
        response.set_cookie('life', 20)
        response.set_cookie('healthy', 100)
        response.set_cookie('anger', 10)
        response.set_cookie('tired', 10)
        response.set_cookie('enjoy', 2)
        response.set_cookie('hungryV', 0.0)
        response.set_cookie('hungryT', Time.now)
        response.set_cookie('sad', 10.0)
        response.set_cookie('name', @req.params['name'])
        response.redirect('/start')
      end

    when '/exit'
      Rack::Response.new('Game Over', 404)
      Rack::Response.new(render("over.html.erb"))

    when '/start'
      Rack::Response.new(render("index.html.erb"))
    when '/change'
      case @req.params['action']
      when 'food'
        food
      end
    else
      Rack::Response.new('Not Found', 404)
    end
  end

  def render(template)
    path = File.expand_path("../../templates/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def name
    name = @req.cookies['name'].delete(' ')
    name.empty? ? 'Pet' : @req.cookies['name']
  end

  def get(attr)
    @req.cookies["#{attr}"]
  end

  private

  def food
    stepByStep(hungry: -5, enjoy: 3)
  end

  def death?(life, healthy)
    life <= 0 || healthy <= 0
  end

  def stepByStep(properties)
    Rack::Response.new do |response|
      hungryV = @req.cookies['hungryV'].to_i
      healthy = @req.cookies['healthy'].to_i
      life = @req.cookies['life'].to_i
      response.set_cookie('healthy', healthy += properties[:healthy]) if properties.key?(:healthy)
      if properties.key?(:hungry)
        hungryV += properties[:hungry]
        response.set_cookie('hungryV', hungryV)
        response.set_cookie('hungryT', Time.now)
      end
      if hungryV > 5 || hungryV < -30
        response.set_cookie('healthy', healthy -= 10)
      end
      response.set_cookie('enjoy', @req.cookies['enjoy'].to_i + properties[:enjoy]) if properties.key?(:enjoy)
      response.set_cookie('healthy', healthy -= 1)
      response.set_cookie('life', life -= 1)
      if death?(healthy, life)
        response.redirect('/exit')
      else
        response.redirect('/start')
      end
    end
  end

end