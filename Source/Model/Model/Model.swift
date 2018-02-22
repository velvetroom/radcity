import Foundation

internal class Model<SpecialisedArchitecture>:ArchitectureMember, ModelProtocol where SpecialisedArchitecture:Architecture
{
    func factoryController<SpecialisedArchitecture>() -> Controller<SpecialisedArchitecture> where SpecialisedArchitecture : Architecture {
        return
    }
    
    internal typealias GenericArchitecture = SpecialisedArchitecture
}
