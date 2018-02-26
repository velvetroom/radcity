import UIKit

internal class Controller<SpecialisedArchitecture>:UIViewController, ControllerProtocol,
    ArchitectureMember where SpecialisedArchitecture:Architecture {
    internal typealias GenericArchitecture = SpecialisedArchitecture
    
    internal init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal override func loadView() {
        self.view = GenericArchitecture.GenericView.view
    }
}
