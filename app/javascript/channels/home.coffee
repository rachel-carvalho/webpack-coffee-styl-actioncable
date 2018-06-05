import cable from 'lib/cable'

ticker = null

Home = cable.subscriptions.create 'HomeChannel',
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log 'connected to home channel'

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log 'disconnected from home channel'

  received: (tick) ->
    # Called when there's incoming data on the websocket for this channel

    unless ticker
      ticker = document.createElement('time')
      document.body.appendChild ticker

    ticker.innerHTML = tick
