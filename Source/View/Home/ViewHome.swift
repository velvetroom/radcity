import UIKit

internal final class ViewHome:View<ArchitectureHome>
{
    //MARK: internal
    
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.red
    }
}
