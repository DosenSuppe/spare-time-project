local TweenService = {}

-- create Tweens

TweenService.createTween = function(object, goals, time, tweenStyle)
    local TWEENSERVICE = {}

    TWEENSERVICE.Time = time
    TWEENSERVICE.Goals = goals
    TWEENSERVICE.Object = object
    TWEENSERVICE.TweenStyle = tweenStyle
    TWEENSERVICE.Cancled = false

    TWEENSERVICE.play = function(self)
        print("Tweening on "..self.Object.Name)

        for property, goal in pairs(self.Goals) do
            print("Playing tween on: "..property.." || With goal: "..goal)
        end
    end

    TWEENSERVICE.cancle = function(self)
        self.Cancled = true
    end

    return TWEENSERVICE
end

return TweenService