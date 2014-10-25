# Description:
#   Introduction of users
#
# Commands:
#   hubot introduce me as - Set your introduction
#   hubot introduce @username - Get users introduction
#
# Author:
#   webjay


module.exports = (robot) ->

  robot.respond /(?:please )intro(?:duce) me as (.*)/i, (msg) ->
    about = msg.match[1].trim()
    user = msg.message.user
    robot.brain.set 'intro-' + user.id, about
    msg.reply 'Thanks ' + user.name + ', I will introduce you as:'
    msg.reply about

  robot.respond /(?:please )intro(?:duce) @?([\w .\-]+)\?*$/i, (msg) ->
    name = msg.match[1].trim()
    users = robot.brain.usersForFuzzyName(name)
    if users.length is 1
      user = users[0]
      about = robot.brain.get 'intro-' + user.id
      if about?
        msg.reply about
      else
        msg.reply "I do not have an introduction of #{name} yet."
    else
      msg.reply "I could not find #{name}."
