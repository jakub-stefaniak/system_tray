
let kDefaultSizeHeight = 18
let kDefaultSizeWidth = 18

class SystemTray {
    var statusItem: NSStatusItem?

    func init_system_tray(title: String, iconBytes: [UInt8], iconBytesLength: Int, toolTip: String) -> Bool {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.toolTip = toolTip
        statusItem?.button?.title = title
       
        let data = NSData(bytes: iconBytes, length: iconBytesLength)
        let image = NSImage(data: Data(referencing: data));
                
        let width = image!.size.width * 18 / image!.size.height
            
        let iconSize = NSMakeSize(width, 18);
        image?.size = iconSize
        
        statusItem?.button?.image = image

        return true
    }

    func set_context_menu(menu: NSMenu) -> Bool {
        statusItem?.menu = menu
        return true
    }
}
