#!/usr/bin/env python3


import time
import urllib.parse
import urllib.request
import random

DSP_OUTLET_IP = '192.168.11.7'
UPDATE_INTERVAL = 5

class DSPInterface(object):
	def __init__(self, plugIp):
		self.ip = plugIp

	def getReading(self):
		pass

		postData = {'request': 'create_chklst'}
		postData = urllib.parse.urlencode(postData).encode("ascii")

		req = urllib.request.Request("http://{ip}/my_cgi.cgi?{rand}".format(ip=self.ip, rand=str(random.random())), data=postData)
		response = urllib.request.urlopen(req)
		ret = response.read().decode("utf-8")
		ret = ret.strip()
		lines = ret.split("\n")

		power = None

		for line in lines:
#			print(line)  # see what lines look like
			if line.startswith("Meter Watt:"):
#				print(line)
				power = line.split(":")[1]

		return power



if __name__ == "__main__":
	print("Starting")

	outlet = DSPInterface(DSP_OUTLET_IP)
	print("Plug opened. Handle = %s" % outlet)


	nextRun = time.time() + UPDATE_INTERVAL
	while 1:
		try:
			powerReading = outlet.getReading()

			if powerReading:
				print(powerReading)

		except:
			raise

		while time.time() < nextRun:
			time.sleep(1)
		nextRun += UPDATE_INTERVAL
#		print("LOOPIN")
