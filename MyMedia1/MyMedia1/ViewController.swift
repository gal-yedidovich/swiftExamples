import UIKit
import AVKit
import AVFoundation
class ViewController: UIViewController {

    let b=Bundle.main;
    var audioPlayer:AVAudioPlayer!;
    var player:AVPlayer!;
    
    @IBOutlet var img:UIImageView!;
    @IBOutlet var vContainer:UIView!;
    
    @IBAction func playAudio(_ btn:UIButton){
        //path to audio file
        let path=b.path(forResource: "terminator", ofType: "mp3")!;
        let url=URL(fileURLWithPath: path);
        //construct player
        do{
           try audioPlayer = AVAudioPlayer(contentsOf: url);
           //Load before playing
           audioPlayer.prepareToPlay();
           //Play it
           audioPlayer.play();
        }catch{
            print("Audio file doesn't work");
        }
    }
    
    @IBAction func playVideo(_ btn:UIButton){
        //url to video
        let url=URL(fileURLWithPath: b.path(forResource: "passengers", ofType: "mp4")!);
        //
        player=AVPlayer(url: url);
        /*
        //Display video as background layer
        let pLayer=AVPlayerLayer(player: player);
        //set layers frame for predefined video container
        pLayer.frame = vContainer.bounds;
        //assign player layer to container (show to user)
        vContainer.layer.addSublayer(pLayer);
        //play the video
        player.play();
        / */
        //Built in video player
        let pvc = AVPlayerViewController();
        pvc.player=player;//assign our player to view controller
        present(pvc, animated: true, completion: {
            self.player.play();//when presented - play video
        });
        // */
    }
    
    @IBAction func pickImg(_ btn:UIButton){
        
    }

}









