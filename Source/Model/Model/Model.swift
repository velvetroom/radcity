import Foundation

internal class Model<SpecialisedArchitecture>:ArchitectureMember where SpecialisedArchitecture:Architecture
{
    internal typealias GenericArchitecture = SpecialisedArchitecture
}
