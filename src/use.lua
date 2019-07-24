local Use = {}

function Use:init(attributes, tags)
	local use = {}
	if attributes["xlink:href"] then
		use.href = attributes["xlink:href"]
	end
	if attributes.href then
		use.href = attributes.href
	end
	if attributes.style then
		use.style = attributes.style
	else
		use.style = {}
	end

	use.tags = tags

	self.__index = self
	setmetatable(use, self)

	use:parseStyles()

	for key,val in ipairs(attributes) do
		if key ~= "style" and key ~= "d" and key ~= "id" then
			use.style[key] = val
		end
	end

	return use

end

function Use:parseStyles()
	self.style = utils.parseStyles(self.style)
end

return Use
