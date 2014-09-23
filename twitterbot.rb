require 'Twitter' #gem install twitter
while true
	begin
		# Create a read write application from : 
		# https://apps.twitter.com
		# authenticate it for your account
		# fill in the following
		config = {
			consumer_key:        'YmxJ2JJXFVnYtJtx17iTBzEcS',
			consumer_secret:     'C3Rdk4AqZAVfop4ksyNU29Li3iHXitRuGUxtY6wIec0j75w8t',
			access_token:        '2546510839-HRmohibBZCdTkraDtkp6Ps2NrEAnmZiOfWYK65P',
			access_token_secret: 'H6Nur9kM2xnQBtfqMTjMp8eJ3E1ykAiXMKjE3qQf4Dtr2'
		}
		rClient = Twitter::REST::Client.new config
		sClient = Twitter::Streaming::Client.new(config)

		# topics to watch
		topics = ['douglas coupland', 'doug coupland', 'microserfs', 'genearation x']
		sClient.filter(:track => topics.join(',')) do |tweet|
			if tweet.is_a?(Twitter::Tweet)
			  puts tweet.text 
			  rClient.fav tweet
			end
		end
	rescue
		puts 'error occurred, waiting for 5 seconds'
		sleep 5
	end

end