import Foundation

internal protocol Architecture {
    associatedtype GenericModel:ModelProtocol
    associatedtype GenericView:ViewProtocol
    associatedtype GenericController:ControllerProtocol
}
