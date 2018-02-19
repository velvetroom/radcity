import Foundation

protocol HomeFilterStateProtocol
{
    var toggleState:((ControllerHome) -> () -> ()) { get }
    
    init()
}
