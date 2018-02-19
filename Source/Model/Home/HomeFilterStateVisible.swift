import Foundation

struct HomeFilterStateVisible:HomeFilterStateProtocol
{
    let toggleState:((ControllerHome) -> () -> ()) = ControllerHome.hideFilter
}
