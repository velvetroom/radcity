import UIKit

internal class View<SpecialisedArchitecture>:UIView,
    ArchitectureMember where SpecialisedArchitecture:Architecture
{
    internal typealias GenericArchitecture = SpecialisedArchitecture
}
