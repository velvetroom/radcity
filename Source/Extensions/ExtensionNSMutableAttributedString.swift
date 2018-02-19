import Foundation

extension NSMutableAttributedString
{
    //MARK: internal
    
    func appendNewLine()
    {
        let newLine:NSAttributedString = NSAttributedString(string:"\n")
        self.append(newLine)
    }
}
