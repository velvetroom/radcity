import Foundation

internal final class ControllerHome:Controller<ArchitectureHome>
{
    //MARK: internal
    
    internal init()
    {
        super.init(
            nibName:nil,
            bundle:nil)
    }
    
    internal required init?(coder:NSCoder)
    {
        return nil
    }
}
