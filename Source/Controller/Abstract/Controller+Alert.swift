import UIKit

extension Controller
{
    //MARK: internal
    
    func showAlert(
        actions:[UIAlertAction],
        title:String? = nil,
        message:String? = nil)
    {
        let alert:UIAlertController = UIAlertController(
            title:title,
            message:message,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        for action:UIAlertAction in actions
        {
            alert.addAction(action)
        }
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = self.view
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
            popover.sourceRect = CGRect(
                x:self.view.center.x,
                y:0,
                width:1,
                height:1)
        }
        
        self.present(
            alert,
            animated:true,
            completion:nil)
    }
}
