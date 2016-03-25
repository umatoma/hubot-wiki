# Description
#   A hubot script for searching wikipedia
#
# Configuration:
#   HUBOT_WIKI_API_URL - https://ja.wikipedia.org/w/api.php
#
# Commands:
#   hubot wiki me <query> - Wikipediaのタイトルで検索し概要を表示
module.exports = (robot) ->
  robot.respond /wiki me (.*)/, (msg) ->
    query = msg.match[1]
    url = process.env.HUBOT_WIKI_API_URL || 'https://ja.wikipedia.org/w/api.php'
    robot.http(url)
      .query({
        action: 'opensearch'
        search: query
        format: 'json'
        limit: 1
      })
      .get() (err, res, body) ->
        robot.logger.debug body
        if err
          robot.logger.error err
          return robot.emit 'error', err, msg
        try
          if res.statusCode isnt 200
            return robot.emit 'error', "#{res.statusCode}: #{body}", msg
          data = JSON.parse body
          robot.logger.debug "Wiki search: #{JSON.stringify(data)}"
          if data[1].length is 0
            return msg.send "Not Found! #{data[0]}"
          msg.send "【#{data[1][0]}】\n#{data[2][0]}\n#{data[3][0]}"
        catch error
          robot.logger.error error
          msg.send "Error! #{body}"