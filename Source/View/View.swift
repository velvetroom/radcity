import UIKit

class View<SpecialisedArchitecture>:UIView,
    ArchitectureMember where SpecialisedArchitecture:Architecture
{
    typealias GenericArchitecture = SpecialisedArchitecture
}
