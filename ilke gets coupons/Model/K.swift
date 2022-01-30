import Foundation

struct K {
    
    static let appName = "ilke wishes"
    
    static let responses = ["no way!","güney is too busy to make your wish come true.","sorry, no luck", "güney says: yav bi siktir git aq!","güney says: no way!","güney says: olur aşko","güney says: git bak bakim ben orada mıyım?","güney says: maybe some other time.", "güney will make your wish true","karşılığında kiviyi alırım.","güney yorgun. başka zaman","güney needs to rest","al sana bi kupon"]
    
    static let positiveResponses = ["güney says: olur aşko", "güney will make your wish true"]
    
    static let coupons = ["güney beni yurda bırak kuponu","güney bana sarılsın kuponu", "bonus", "güneyden bir kahve kuponu", "yemek güney'den kuponu", "güney bana bira alsın kuponu", "güney'den bir öpücük kuponu", "güney ile kadıköy turu kuponu", "güney karşıya geçsin kuponu","1 saat sülo terapisi kazandınız.", "güney ödevimi yapsın ben yatayım kuponu", "güney ile martı motor turu", "güney çay ısmarlasın kuponu","guney beni metrobüse bırak kuponu","guney ile kedi sevme kuponu","guney beni havuza götür kuponu"]

    static let segue = "couponSegue"
    static let wishLeft = "no wishes left. but you can take a coupon."
    static let notifications = [
        Notifications(t: "you have a message from guney!", b: "how you doin?"),
        Notifications(t: "bırak artık telefonu", b: "git biraz ui/ux çalış aq!"),
        Notifications(t: "guney iyi günler diler!", b: "dikkat et!"),
        Notifications(t: "guney is watching you...", b: "be careful")]
}
