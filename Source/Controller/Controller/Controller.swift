import UIKit

internal class Controller<SpecialisedArchitecture>:UIViewController,
    ArchitectureMember where SpecialisedArchitecture:Architecture
{
    internal typealias GenericArchitecture = SpecialisedArchitecture
    
    //MARK: internal
    
    internal override func viewDidLoad()
    {
        
    }
}
