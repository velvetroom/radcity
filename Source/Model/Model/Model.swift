import Foundation

internal class Model<SpecialisedArchitecture>:ArchitectureMember, ModelProtocol where SpecialisedArchitecture:Architecture
{
    internal typealias GenericArchitecture = SpecialisedArchitecture
    
    internal let controllerType:ControllerProtocol.Type = SpecialisedArchitecture.GenericController.self
}
