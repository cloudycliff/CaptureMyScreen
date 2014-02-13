#import <libactivator/libactivator.h>
#import "CaptureMyScreen.h"

@interface CaptureMyScreenListener : NSObject<LAListener, UIAlertViewDelegate> {}
@end

@implementation CaptureMyScreenListener

+(void)load {
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.cloudycliff.capturemyscreen"];
}

- (void)activator:(LAActivator *)listener receiveEvent:(LAEvent *)event
{
	UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
	[error show];
	[error release];

	[event setHandled:YES];
}

-(void)activator:(LAActivator *)listener abortEvent:(LAEvent *)event
{
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if(buttonIndex == 1) {
		CaptureMyScreen *_screenCapturer = [[CaptureMyScreen alloc] init];
        
        CGImageRef cgImage = [_screenCapturer captureMyScreen];

        UIImage *img = [UIImage imageWithCGImage:cgImage];

	    NSString *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/test.png"];
	    [UIImagePNGRepresentation(img) writeToFile:pngPath atomically:YES];  

        CGImageRelease(cgImage);
        [_screenCapturer release];
	}
}

@end;