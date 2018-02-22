import UIKit

internal class View<SpecialisedArchitecture>:UIView,
    ArchitectureMember, ViewProtocol where SpecialisedArchitecture:Architecture
{
    internal typealias GenericArchitecture = SpecialisedArchitecture
    
    internal var presentationLayout:PresentationLayout
    
    override init(frame:CGRect)
    {
        self.presentationLayout = PresentationLayout()
            
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
