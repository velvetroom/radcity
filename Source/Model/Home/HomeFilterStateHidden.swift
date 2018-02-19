import Foundation

struct HomeFilterStateHidden:HomeFilterStateProtocol
{
    let toggleState:((ControllerHome) -> () -> ()) = ControllerHome.showFilter
}
