require "./CashMachine"

require 'socket'
require 'rack'
require 'rack/utils'
require 'rack/response'


class Server
	def call(env)
		bancomat = CashMachine.new 
		req = Rack::Request.new(env)
		
		case req.path_info
			
		when '/deposit?value='
			
			[200, {'Content-Type' => 'text/html'}, ["deposit "]]

		when '/withdraw?value='
			
			[200, {'Content-Type' => 'text/html'}, ["withdraw "]]
        when '/balance' 
			[200, {'Content-Type' => 'text/plain'}, ["your balance #{bancomat.balance.lines} "]]
		else
			[404, {'Content-Type' => 'text/html'}, ["For deposit input /deposit?value= ; For withdraw input /withdraw?value= ; For balance input /balance"]]
		end
	end
end

server =  Server.new
run server
