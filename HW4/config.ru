
require 'D:\RubyHW\HW4\app\Tam.rb'

use Rack::Reloader, 0
use Rack::Static, :urls => ['/public']
use Rack::Auth::Basic do |username, password|
  [username, password] == ['admin', 'admin']
end
run Pet

