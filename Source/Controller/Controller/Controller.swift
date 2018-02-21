import UIKit

class Controller<SpecialisedArchitecture>:UIViewController,
    ArchitectureMember where SpecialisedArchitecture:Architecture
{
    typealias GenericArchitecture = SpecialisedArchitecture
}
