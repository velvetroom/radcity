import UIKit

internal struct PresentationInitial<PresentedArchitecture:Architecture>:PresentationProtocol
{
    internal func factoryModel<PresentedArchitecture>() -> Model<PresentedArchitecture>
    {
        let model:Model<PresentedArchitecture> = Model<PresentedArchitecture>()
        
        return model
    }
}
