require "/scripts/util.lua"

function init()
	activeItem.setTwoHandedGrip(false)
	
	ratio = 0.5
	speed = config.getParameter("speed", 1)
end

function update(dt)
	ratio = util.wrap(ratio + dt * speed, -1, 1)

	animator.resetTransformationGroup("chip")
	animator.scaleTransformationGroup("chip", 0.025)
	animator.translateTransformationGroup("chip", {0, util.easeInOutSin(math.abs(ratio), -0.25, 0.25)})
	
	for i = 2, 100 do
		animator.setPartTag("chip"..i, "vis", (i <= item.count() and "" or "?multiply=0000"))
	end
end