import Foundation

internal final class ControllerHome:Controller<ArchitectureHome>
{
    init()
    {
        super.init(
            nibName:nil,
            bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
