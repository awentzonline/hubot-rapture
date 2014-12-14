# Description:
#   Reports the current rapture index
#

module.exports = (robot) ->
  robot.hear /rapture/i, (msg) ->
    robot.http("http://www.raptureready.com/rap2.html")
    .get() (err, res, body) ->
      try
        match = body.match(/Rapture Index (\d+)/)
        currentIndex = parseInt(match[1])
        msg.send "Current rapture index: #{currentIndex}"
      catch error
        msg.send "Rapture may have already begun: #{error}"