require 'Twitter' #gem install twitter
while true
	begin
		# Create a read write application from : 
		# https://apps.twitter.com
		# authenticate it for your account
		# fill in the following
		config = {
			consumer_key:        'rbMbrWYpPQHzjJqztrqthdrIH',
			consumer_secret:     'N68ysVOyiPPKxaGbg277nZtBrM10l2PqqUNxWIXuLFWkVCQvuA',
			access_token:        '2546510839-KgNWtNBrd4EUg6qaUKfe1Dj2qO4MMc2rsYWg9UW',
			access_token_secret: 'n3lj6YuMn2hNsH460xsLhAfp5LHHFJLcUVITbdAin18NY'
		}
		rClient = Twitter::REST::Client.new config
		sClient = Twitter::Streaming::Client.new(config)

		# topics to watch
		topics = ['douglas coupland', 'doug coupland', 'microserfs', 'generation x']
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
