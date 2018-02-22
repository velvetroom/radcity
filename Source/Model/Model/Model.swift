import Foundation

class Model<SpecialisedArchitecture>:ArchitectureMember where SpecialisedArchitecture:Architecture
{
    typealias GenericArchitecture = SpecialisedArchitecture
}
