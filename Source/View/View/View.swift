import UIKit

internal class View<SpecialisedArchitecture>:UIView,
    ArchitectureMember, ViewProtocol where SpecialisedArchitecture:Architecture
{
    internal typealias GenericArchitecture = SpecialisedArchitecture
}
