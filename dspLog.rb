#!/usr/bin/env ruby

### this is intended to be a recoding in ruby of the python script
### started, not done

require time
require urllib.parse
require urllib.request
require random

DSP_OUTLET_IP = '192.168.11.7'
UPDATE_INTERVAL = 5


class DSPInterface

  def init(plugIP)
    ip = plugIp
  end

  def getReading
    postData = request: 'create_chklist'
    postData = ???

    req = ???
    response = ???
    ret = ?
    ret = ?
    lines = ret.split("\n")

    lines.each do |line|
      puts line

      if line.Starting("Meter Watt:")
        fields = line.split(":")
        if fields.count == 2
          power = fields[1]
        else
          power = "bad string"
      else 
        power = "missing line"
    end
  end

  power

end


    postData = {'request': 'create_chklst'}
    postData = urllib.parse.urlencode(postData).encode("ascii")

    req = urllib.request.Request("http://{ip}/my_cgi.cgi?{rand}".format(ip=self.ip, rand=str(random.random())), data=postData)
    response = urllib.request.urlopen(req)
    ret = response.read().decode("utf-8")
    ret = ret.strip()

puts "Starting"

outlet = DSPInterface(DSP_OUTLET_IP)
puts "Plug opened. Handle = #{outlet}"


  nextRun = time.now + UPDATE_INTERVAL
while true do
    
    begin
      powerReading = outlet.getReading()
      puts powerReading if powerReading

    rescue
      puts "error reading"
    end

    while time.now < nextRun:
      time.sleep(1)
    nextRun += UPDATE_INTERVAL
end
