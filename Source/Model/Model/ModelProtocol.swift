import Foundation

protocol ModelProtocol
{
    func factoryController<SpecialisedArchitecture:Architecture>() -> Controller.ty<SpecialisedArchitecture>
}
