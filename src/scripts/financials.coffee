module.exports = (robot) ->
  robot.respond /current balance/, (res) ->
    res.reply 'Here is your current balance: 0€'