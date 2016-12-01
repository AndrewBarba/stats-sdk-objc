#import "ViewController.h"

@import MUXSDKStats;

static NSString *DEMO_PLAYER_NAME = @"demoplayer";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL* videoURL = [NSURL URLWithString:@"http://www.streambox.fr/playlists/x36xhzz/x36xhzz.m3u8"];
    _avplayer = [AVPlayer playerWithURL:videoURL];
    _avplayerController = [AVPlayerViewController new];
    _avplayerController.player = _avplayer;

    // TODO: Add your property key!
    MUXSDKCustomerPlayerData *playerData = [[MUXSDKCustomerPlayerData alloc] initWithPropertyKey:@""];
    MUXSDKCustomerVideoData *videoData = [MUXSDKCustomerVideoData new];
    videoData.videoTitle = @"Big Buck Bunny";
    videoData.videoId = @"bigbuckbunny";
    videoData.videoSeries = @"animation";
    [MUXSDKStats monitorAVPlayerViewController:_avplayerController
                                withPlayerName:DEMO_PLAYER_NAME
                                    playerData:playerData
                                     videoData:videoData];

    [_avplayer play];

    [self addChildViewController:_avplayerController];
    [self.view addSubview:_avplayerController.view];
    _avplayerController.view.frame = self.view.frame;

    // After 20 seconds, we'll change the video.
    _videoChangeTimer = [NSTimer scheduledTimerWithTimeInterval:20.0
                                                         target:self
                                                       selector:@selector(changeVideo:)
                                                       userInfo:nil
                                                        repeats:NO];
}

- (void)changeVideo:(NSTimer *)timer {
    MUXSDKCustomerVideoData *videoData = [MUXSDKCustomerVideoData new];
    videoData.videoTitle = @"Apple Keynote";
    videoData.videoId = @"applekeynote2010";
    [MUXSDKStats videoChangeForPlayer:DEMO_PLAYER_NAME
                        withVideoData:videoData];

    NSURL* videoURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
    AVPlayerItem *keynote = [AVPlayerItem playerItemWithURL:videoURL];
    [_avplayer replaceCurrentItemWithPlayerItem:keynote];
    [_avplayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
