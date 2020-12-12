require "/scripts/util.lua"

function init()
	activeItem.setTwoHandedGrip(false)
	
	ratio = 0.5
	speed = config.getParameter("speed", 1)
	scale = config.getParameter("scale", 0.025)
	hover = config.getParameter("hover", {-0.25, 0.25})
	stack = config.getParameter("stack", true)
	stackDone = false
end

function update(dt)
	ratio = util.wrap(ratio + dt * speed, -1, 1)

	animator.resetTransformationGroup("chip")
	animator.scaleTransformationGroup("chip", scale)
	animator.translateTransformationGroup("chip", {0, util.easeInOutSin(math.abs(ratio), hover[1], hover[2])})
	
	if not stackDone then
		for i = 2, 100 do
			animator.setPartTag("chip"..i, "vis", (i <= item.count() and "" or "?multiply=0000"))
		end
		if stack then
			stackDone = true
		end
	end
end