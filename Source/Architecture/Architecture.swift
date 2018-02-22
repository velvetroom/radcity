import Foundation

internal protocol Architecture
{
    associatedtype GenericModel:ModelProtocol
    associatedtype GenericView
    associatedtype GenericController
}
