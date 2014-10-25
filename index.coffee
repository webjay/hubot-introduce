Path = require 'path'

module.exports = (robot) ->
  file = 'hubot-introduce.coffee'
  path = Path.resolve __dirname, 'scripts'
  robot.loadFile path, file
  robot.parseHelp Path.join(path, file)
