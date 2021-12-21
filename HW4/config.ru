
require 'D:\RubyHW\HW4\app\Tam.rb'

use Rack::Reloader, 0
use Rack::Static, :urls => ['/public']
run Pet
