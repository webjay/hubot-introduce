Path = require 'path'

module.exports = (robot) ->
  file = 'hubot-introduce.coffee'
  path = Path.resolve __dirname, 'src'
  robot.loadFile path, file
