import UIKit
class ShootingViewController: UIViewController {
    //when touching screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point=touches.first!.location(in: view);//touching point
        let shot=UIImageView(image: UIImage(named: "gunShot"));//create gun shot view
        shot.frame=CGRect(x: point.x-10, y: point.y-10, width: 20, height: 20);//at needed point
        view.addSubview(shot);//show it to user
    }
}
