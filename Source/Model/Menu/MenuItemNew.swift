import UIKit

struct MenuItemNew:MenuItemGenericProtocol
{
    typealias A = ArchNew
    let order:Menu.Order = Menu.Order.new
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuNew")
}
