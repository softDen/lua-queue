function getQueue()
	local get = function(self)
		if self["min"] >= self["max"] then
			print("Tried get value from empty queue")
			error()
		end
		local val = self["data"][self["min"]]
		self["min"] = self["min"] + 1
		return val
	end
	local put = function(self, val)
		self["data"][self["max"]] = val
		self["max"] = self["max"] + 1
	end

	queueObj = {}
	queueObj["data"] = {}
	queueObj["min"] = 1
	queueObj["max"] = 1
	queueObj["get"] = get
	queueObj["put"] = put

	return queueObj
end
