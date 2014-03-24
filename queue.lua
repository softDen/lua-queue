function getQueue(autoReduce)
	autoReduce = autoReduce or 50

	queueObj = {}

	queueObj.get = function(self)
		if self["min"] >= self["max"] then
			print("Tried get value from empty queue")
			error()
		end
		local val = self["data"][self["min"]]
		self["min"] = self["min"] + 1
		if self["min"] > autoReduce then
			self:reduce()
		end
		return val
	end
	queueObj.put = function(self, val)
		self["data"][self["max"]] = val
		self["max"] = self["max"] + 1
	end
	queueObj.reduce = function(self)
		for i=self["min"],#self["data"] do
			self["data"][i-self["min"]+1] = self["data"][i]
		end
		self["max"] = self["max"] - self["min"]+1
		self["min"] = 1
		for i=self["max"],#self["data"] do
			self["data"][i] = nil
		end
	end
	queueObj.printQueue = function(self)
		io.write("\27[34m")
		for x, e in pairs(self.data) do
			if x == self.min then
				io.write("\27[32m"..e.."\27[33m ")
			else
				io.write(e.." ")
			end
		end
		io.write("\27[0m\n")
	end

	queueObj["data"] = {}
	queueObj["min"] = 1
	queueObj["max"] = 1

	return queueObj
end
