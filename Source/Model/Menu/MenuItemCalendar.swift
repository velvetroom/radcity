import UIKit

struct MenuItemCalendar:MenuItemGenericProtocol
{
    typealias A = ArchCalendar
    let order:Menu.Order = Menu.Order.calendar
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuCalendar")
}
