import UIKit

protocol PresentationProtocol
{
    func factoryModel<PresentedArchitecture:Architecture>() -> Model<PresentedArchitecture>
}
