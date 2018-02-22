import Foundation

internal final class ControllerHome:Controller<ArchitectureHome>
{
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
