import UIKit

class ViewMain<SpecialisedArchitecture>:UIView,
    ArchitectureMember where SpecialisedArchitecture:Architecture
{
    typealias GenericArchitecture = SpecialisedArchitecture
}
