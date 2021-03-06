# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Morris.Donut
    element: 'social-connections'
    data: [
        {label: "Twitter", value: $('#social-connections').data('twitter')}
        {label: "Facebook", value: $('#social-connections').data('facebook')}
        {label: "Instagram", value: $('#social-connections').data('instagram')}
        {label: "Foursquare", value: $('#social-connections').data('foursquare')}
        {label: "LinkedIn", value: $('#social-connections').data('linkedin')}
    ]
  Morris.Donut
    element: 'ivolve-connections'
    data: [
        {label: "Twitter", value: $('#ivolve-connections').data('twitter')}
        {label: "Facebook", value: $('#ivolve-connections').data('facebook')}
        {label: "Instagram", value: $('#ivolve-connections').data('instagram')}
        {label: "Foursquare", value: $('#ivolve-connections').data('foursquare')}
        {label: "LinkedIn", value: $('#ivolve-connections').data('linkedin')}
    ]
  Morris.Donut
    element: 'social-engagement'
    data: [
        {label: "Twitter", value: $('#social-engagement').data('twitter')}
        {label: "Facebook", value: $('#social-engagement').data('facebook')}
        {label: "Instagram", value: $('#social-engagement').data('instagram')}
        {label: "Foursquare", value: $('#social-engagement').data('foursquare')}
        {label: "LinkedIn", value: $('#social-engagement').data('linkedin')}
    ]
  Morris.Donut
    element: 'ivolve-engagement'
    data: [
        {label: "Twitter", value: $('#ivolve-engagement').data('twitter')}
        {label: "Facebook", value: $('#ivolve-engagement').data('facebook')}
        {label: "Instagram", value: $('#ivolve-engagement').data('instagram')}
        {label: "Foursquare", value: $('#ivolve-engagement').data('foursquare')}
        {label: "LinkedIn", value: $('#ivolve-engagement').data('linkedin')}
    ]
  Morris.Donut
    element: 'twitterfollowersfollowing'
    data: [
        {label: "Followers", value: $('#twitterfollowersfollowing').data('myfollowers')}
        {label: "Following", value: $('#twitterfollowersfollowing').data('myfollowing')}
    ]
  Morris.Donut
    element: 'twitterfollowersfollowingindex'
    data: [
        {label: "Followers", value: $('#twitterfollowersfollowingindex').data('indexfollowers')}
        {label: "Following", value: $('#twitterfollowersfollowingindex').data('indexfollowing')}
    ]
  Morris.Line
    element: 'connections-daily'
    data: $('#connections-daily').data('connections')
    xkey: 'created_at'   
    ykeys: ['linkedin_connections', 'twitter_connections', 'facebook_connections', 'instagram_connections', 'foursquare_connections']  
    labels: ['LinkedIn', 'Twitter', 'Facebook', 'Instagram', 'Foursquare']
    xLabelFormat: (date) ->
        daynum = date.getDay()
        dayArray = ["Sun.", "Mon.", "Tue.", "Wed.", "Thu.", "Fri.", "Sat."]
        day = dayArray[daynum]
        day
  Morris.Area
    element: 'connections-line'
    data: $('#connections-line').data('connections')
    xkey: 'created_at'   
    ykeys: ['linkedin_connections_total', 'twitter_connections_total', 'facebook_connections_total', 'instagram_connections_total', 'foursquare_connections_total']  
    labels: ['LinkedIn', 'Twitter', 'Facebook', 'Instagram', 'Foursquare']
    xLabelFormat: (date) ->
        daynum = date.getDay()
        dayArray = ["Sun.", "Mon.", "Tue.", "Wed.", "Thu.", "Fri.", "Sat."]
        day = dayArray[daynum]
        day
  Morris.Line
    element: 'engagement-daily'
    data: $('#engagement-daily').data('engagement')
    xkey: 'created_at'   
    ykeys: ['linkedin_engagement', 'twitter_engagement', 'facebook_engagement', 'instagram_engagement', 'foursquare_engagement']  
    labels: ['LinkedIn', 'Twitter', 'Facebook', 'Instagram', 'Foursquare']
    xLabelFormat: (date) ->
        daynum = date.getDay()
        dayArray = ["Sun.", "Mon.", "Tue.", "Wed.", "Thu.", "Fri.", "Sat."]
        day = dayArray[daynum]
        day
  Morris.Area
    element: 'engagement-line'
    data: $('#engagement-line').data('engagement')
    xkey: 'created_at'   
    ykeys: ['linkedin_engagement_total', 'twitter_engagement_total', 'facebook_engagement_total', 'instagram_engagement_total', 'foursquare_engagement_total']  
    labels: ['LinkedIn', 'Twitter', 'Facebook', 'Instagram', 'Foursquare']
    xLabelFormat: (date) ->
        daynum = date.getDay()
        dayArray = ["Sun.", "Mon.", "Tue.", "Wed.", "Thu.", "Fri.", "Sat."]
        day = dayArray[daynum]
        day
  Morris.Donut
    element: 'twitter-outvin'
    data: [
        {label: "Output", value: $('#twitter-outvin').data('output')}
        {label: "Input", value: $('#twitter-outvin').data('input')}
    ]
  Morris.Donut
    element: 'ivolve-twitter-outvin'
    data: [
        {label: "Output", value: $('#ivolve-twitter-outvin').data('output')}
        {label: "Input", value: $('#ivolve-twitter-outvin').data('input')}
    ]