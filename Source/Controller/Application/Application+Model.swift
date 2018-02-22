import Foundation

internal extension Application
{
    //MARK: internal
    
    internal class func factoryInitialController<SpecialisedArchitecture>() -> Controller<SpecialisedArchitecture>
    {
        let controller:Controller<SpecialisedArchitecture> = SpecialisedArchitecture.GenericController()
        
        return controller
    }
}
