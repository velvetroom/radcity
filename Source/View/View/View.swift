import UIKit

internal class View<SpecialisedArchitecture>:UIView,
    ArchitectureMember, ViewProtocol where SpecialisedArchitecture:Architecture
{
    internal typealias GenericArchitecture = SpecialisedArchitecture
    
    internal var presentationLayout:PresentationLayout
    
    //MARK: internal
    
    internal override init(frame:CGRect)
    {
        self.presentationLayout = PresentationLayout()
            
        super.init(frame:frame)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.sharedBackgroundColour
        self.factoryViews()
    }
    
    internal required init?(coder:NSCoder)
    {
        return nil
    }
    
    internal func factoryViews() {  }
}
