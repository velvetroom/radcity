import UIKit

struct ControllerTransitionPop
{
    var completion:(() -> ())?
    var left:CGFloat
    var top:CGFloat
    var index:Int
    
    init()
    {
        self.left = 0
        self.top = 0
        self.index = 0
    }
}
