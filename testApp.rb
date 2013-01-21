require 'bundler'
require 'sinatra'
require 'mongo_mapper'

MongoMapper.database = 'testApp'

class Status

	include MongoMapper::Document

	key :content, type: String, :required => true
	timestamps!

end

class TestApp 
	
	get '/' do
		@status = Status.all :order => :created_at.desc
		erb :home  
	end

	post '/' do  
		update = Status.new  
		update.content = params[:content] 
		update.save  
		redirect '/'  
	end  

end
