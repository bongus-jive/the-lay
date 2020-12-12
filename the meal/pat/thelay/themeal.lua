require "/scripts/util.lua"

function init()
	activeItem.setTwoHandedGrip(false)
	
	params = config.getParameter("params")
	ratios = {}
end

function update(dt)
	for k, v in pairs(params) do
		if not ratios[k] then ratios[k] = util.randomInRange({-1, 1}) end
		local hover = v.hover or {-0.25, 0.25}
		ratios[k] = util.wrap(ratios[k] + dt * (v.speed or 1), -1, 1)

		animator.resetTransformationGroup(k)
		animator.scaleTransformationGroup(k, v.scale or 0.025)
		animator.translateTransformationGroup(k, {0, util.easeInOutSin(math.abs(ratios[k]), hover[1], hover[2])})
	end
end