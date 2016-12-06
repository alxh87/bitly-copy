require 'byebug'

get '/' do
  erb :"static/index"
end

post '/urls' do
	a= Url.create(long_url: params[:long_url])
	if a.valid?
		# a.getTitle
		# # a.shorten
		# a.save
		# redirect "/"
		return {url: a}.to_json
	else 
		{error: "Enter URL starting with 'http...'"}.to_json
		# redirect '/'
	end
	# erb :"static/index"
end



get '/:short_url' do

	url = Url.find_by(short_url: params[:short_url])
	url.click_count+=1
	url.save
	redirect url.long_url
	# Url.all[9].long_url
# if target=~/^h/
# byebug
	# redirect target
	# byebug
# else
	# redirect "http://" + target[0].long_url
# end

end

