jQuery ->
  if $('#scrolling').size() > 0
    $(window).scroll ->
      more_tweets_url = $('.pagination .next_page').attr('href')
      if more_tweets_url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Loading more Tweets...")
        $.getScript(more_tweets_url)
    $(window).scroll()
    
