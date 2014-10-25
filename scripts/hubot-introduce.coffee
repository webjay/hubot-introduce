# Description:
#   Introduction of users
#
# Commands:
#   hubot introduce me as <introduction> - Set your introduction
#   hubot introduce <username> - Get users introduction
#
# Author:
#   webjay


module.exports = (robot) ->

  robot.respond /introduce me as (.*)/i, (msg) ->
    intro = msg.match[1].trim()
    if not intro?
      msg.reply 'Your introduction is a bit too short.'
      return
    user = msg.message.user
    robot.brain.set 'intro-' + user.id, intro
    msg.reply "Thank you #{user.name}, I will introduce you as: #{intro}"

  robot.respond /introduce (?!me as )@?([\w .\-]+)\?*$/i, (msg) ->
    name = msg.match[1].trim()
    users = robot.brain.usersForFuzzyName(name)
    if users.length is 1
      user = users[0]
      intro = robot.brain.get 'intro-' + user.id
      if intro?
        msg.reply intro
      else
        msg.reply "I do not have an introduction of #{name} yet."
    else
      msg.reply "I could not find #{name}."
