//
//  DemoMessageViewController.m
//  ChatDesignApp
//
//  Created by Vadim on 4/10/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "DemoMessageViewController.h"
#import "JSQMessage.h"
#import <JSQMessagesBubbleImageFactory.h>
#import "RequestManager.h"
#import "FriendsViewController.h"
#import "JTSImageViewController.h"
#import "JTSImageInfo.h"

#import "STEmojiKeyboard.h"

@interface DemoMessageViewController ()

@property (strong, nonatomic) dispatch_source_t timer;


@end

@implementation DemoMessageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.title = [NSString stringWithFormat:@"%@",self.name];
    self.navigationItem.title =@"Vadim";
    
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(155/255.0) green:(186/255.0) blue:(205/255.0) alpha:1];
    
   // self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    CGRect frame = CGRectMake(0, 0, 50, 44);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:13.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines =0;
    label.text = [NSString stringWithFormat:@"chat with \n%@",self.name];
    self.navigationItem.titleView = label;
    
    
    
    self.inputToolbar.contentView.textView.pasteDelegate = self;
    self.inputToolbar.clipsToBounds =YES;
    self.demoData = [[DemoModel alloc] init];
    
    kJSQDemoAvatarDisplayNameCook = self.name;
    kJSQDemoAvatarIdCook = self.userID;
    NSLog(@"user id este %@",kJSQDemoAvatarIdCook);
    
    NSLog(@"Name is %@",self.name);
    
    [self.inputToolbar.contentView.textView setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    

    self.showLoadEarlierMessagesHeader = YES;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage jsq_defaultTypingIndicatorImage]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(receiveMessagePressed:)];
    
    
    
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleCollectionTapRecognizer:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
    
   // [self startTimer];
    NSLog(@"Timer starts");

    
    
}

-(void)viewDidLayoutSubviews
{
    
}


//- (void)startTimer
//{
//    if (!self.timer) {
//        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    }
//    if (self.timer) {
//        dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), 3ull*NSEC_PER_SEC, 10ull*NSEC_PER_SEC);
//        dispatch_source_set_event_handler(_timer, ^(void) {
//            [self tick];
//        });
//        dispatch_resume(_timer);
//    }
//}
//- (void)tick
//{
//    [self receiveMessagePressed:nil];
//}

- (void)didPressSendButton:(UIButton *)button
           withMessageText:(NSString *)text
                  senderId:(NSString *)senderId
         senderDisplayName:(NSString *)senderDisplayName
                      date:(NSDate *)date
{
    
    
    /**
     *  Sending a message. Your implementation of this method should do *at least* the following:
     *
     *  1. Play sound (optional)
     *  2. Add new id<JSQMessageData> object to your data source
     *  3. Call `finishSendingMessage`
     */
    
    // [JSQSystemSoundPlayer jsq_playMessageSentSound];
    
    [[RequestManager sharedManager]sendMessage:text andId:@"26"];
    
    JSQMessage *message = [[JSQMessage alloc] initWithSenderId:senderId
                                             senderDisplayName:senderDisplayName
                                                          date:date
                                                          text:text];
    
    [self.demoData.messages addObject:message];
    
    [self finishSendingMessageAnimated:YES];
}
-(void)receiveMessagePressed:(UIBarButtonItem *)sender
{
//    self.showTypingIndicator = !self.showTypingIndicator;
     [self scrollToBottomAnimated:YES];
    [[RequestManager sharedManager]getMessagefromID:self.userID onSucces:^(NSDictionary *messageDictionaries)
    {
       // NSLog(@"sender id is %@",[messageDictionaries valueForKey:@"sender_id"])
        
        if([[[messageDictionaries valueForKey:@"sender_id" ]stringValue] isEqualToString:kJSQDemoAvatarIdSquires])
        {
            JSQMessage *copyMessage = [JSQMessage
                                       messageWithSenderId:kJSQDemoAvatarIdSquires
                                       displayName:kJSQDemoAvatarDisplayNameCook
                                       text:[messageDictionaries valueForKey:@"text"]];
            
            
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            [self.demoData.messages addObject:copyMessage];
            [self finishReceivingMessageAnimated:YES];
        }
        else
        {
            JSQMessage *copyMessage = [JSQMessage
                                       messageWithSenderId:kJSQDemoAvatarIdCook
                                       displayName:kJSQDemoAvatarDisplayNameCook
                                       text:[messageDictionaries valueForKey:@"text"]];
            
            //  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.demoData.messages addObject:copyMessage];
            [self finishReceivingMessageAnimated:YES];
        }
   
//        });
        
    }onFail:^(NSError *error ,NSInteger statusCode)
    {
        
        NSLog(@"Error is %@ , and Status is %ld",[error localizedDescription],(long)statusCode);
    }];
//    JSQMessage *copyMessage = [[self.demoData.messages lastObject] copy];
//    
//    if (!copyMessage) {
//        copyMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdJobs
//                                          displayName:kJSQDemoAvatarDisplayNameJobs
//                                                 text:@"First received!"];
//    }
    
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        NSMutableArray *userIds = [[self.demoData.users allKeys] mutableCopy];
//        [userIds removeObject:self.senderId];
//        NSLog(@"User Id %@",userIds);
//        
//        NSString *randomUserId = userIds[arc4random_uniform((int)[userIds count])];
//        
//        
//       JSQMessage *newMessage = [JSQMessage messageWithSenderId:randomUserId
//                                         displayName:self.demoData.users[randomUserId]
//                                                text:copyMessage.text];
//
//        
//        [self.demoData.messages addObject:newMessage];
//        [self finishReceivingMessageAnimated:YES];
//    });

}
#pragma mark - JSQMessages CollectionView DataSource
- (NSString *)senderId {
    return kJSQDemoAvatarIdSquires;
}

- (NSString *)senderDisplayName {
    return kJSQDemoAvatarDisplayNameSquires;
}

- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.demoData.messages objectAtIndex:indexPath.item];
}

- (void)collectionView:(JSQMessagesCollectionView *)collectionView didDeleteMessageAtIndexPath:(NSIndexPath *)indexPath
{
    [self.demoData.messages removeObjectAtIndex:indexPath.item];
}

- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  You may return nil here if you do not want bubbles.
     *  In this case, you should set the background color of your collection view cell's textView.
     *
     *  Otherwise, return your previously created bubble image data objects.
     */
    
    JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    if ([message.senderId isEqualToString:self.senderId]) {
        return self.demoData.outgoingBubbleImageData;
    }
    
    return self.demoData.incomingBubbleImageData;
}

-(id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  Return `nil` here if you do not want avatars.
     *  If you do return `nil`, be sure to do the following in `viewDidLoad`:
     *
     *  self.collectionView.collectionViewLayout.incomingAvatarViewSize = CGSizeZero;
     *  self.collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero;
     *
     *  It is possible to have only outgoing avatars or only incoming avatars, too.
     */
    
    /**
     *  Return your previously created avatar image data objects.
     *
     *  Note: these the avatars will be sized according to these values:
     *
     *  self.collectionView.collectionViewLayout.incomingAvatarViewSize
     *  self.collectionView.collectionViewLayout.outgoingAvatarViewSize
     *
     *  Override the defaults in `viewDidLoad`
     */
    JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    return [self.demoData.avatars objectForKey:message.senderId];
}

- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  This logic should be consistent with what you return from `heightForCellTopLabelAtIndexPath:`
     *  The other label text delegate methods should follow a similar pattern.
     *
     *  Show a timestamp for every 3rd message
     */
    if (indexPath.item % 3 == 0) {
        JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
        return [[JSQMessagesTimestampFormatter sharedFormatter] attributedTimestampForDate:message.date];
    }
    
    return nil;
}
- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    /**
     *  iOS7-style sender name labels
     */
    if ([message.senderId isEqualToString:self.senderId]) {
        return nil;
    }
    
    if (indexPath.item - 1 > 0) {
        JSQMessage *previousMessage = [self.demoData.messages objectAtIndex:indexPath.item - 1];
        if ([[previousMessage senderId] isEqualToString:message.senderId]) {
            return nil;
        }
    }
    
    /**
     *  Don't specify attributes to use the defaults.
     */
    return [[NSAttributedString alloc] initWithString:message.senderDisplayName];
}

- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.demoData.messages count];
}

- (UICollectionViewCell *)collectionView:(JSQMessagesCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  Override point for customizing cells
     */
    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    /**
     *  Configure almost *anything* on the cell
     *
     *  Text colors, label text, label colors, etc.
     *
     *
     *  DO NOT set `cell.textView.font` !
     *  Instead, you need to set `self.collectionView.collectionViewLayout.messageBubbleFont` to the font you want in `viewDidLoad`
     *
     *
     *  DO NOT manipulate cell layout information!
     *  Instead, override the properties you want on `self.collectionView.collectionViewLayout` from `viewDidLoad`
     */
    
    JSQMessage *msg = [self.demoData.messages objectAtIndex:indexPath.item];
    
    if (!msg.isMediaMessage) {
        
        if ([msg.senderId isEqualToString:self.senderId]) {
            cell.textView.textColor = [UIColor blackColor];
        }
        else {
            cell.textView.textColor = [UIColor whiteColor];
        }
        
        cell.textView.linkTextAttributes = @{ NSForegroundColorAttributeName : cell.textView.textColor,
                                              NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
    }
    
    
    return cell;
}
#pragma mark - JSQMessages collection view flow layout delegate

#pragma mark - Adjusting cell label heights

- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  Each label in a cell has a `height` delegate method that corresponds to its text dataSource method
     */
    
    /**
     *  This logic should be consistent with what you return from `attributedTextForCellTopLabelAtIndexPath:`
     *  The other label height delegate methods should follow similarly
     *
     *  Show a timestamp for every 3rd message
     */
    if (indexPath.item % 3 == 0) {
        return kJSQMessagesCollectionViewCellLabelHeightDefault;
    }
    
    return 0.0f;
}

- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  iOS7-style sender name labels
     */
    JSQMessage *currentMessage = [self.demoData.messages objectAtIndex:indexPath.item];
    if ([[currentMessage senderId] isEqualToString:self.senderId]) {
        return 0.0f;
    }
    
    if (indexPath.item - 1 > 0) {
        JSQMessage *previousMessage = [self.demoData.messages objectAtIndex:indexPath.item - 1];
        if ([[previousMessage senderId] isEqualToString:[currentMessage senderId]]) {
            return 0.0f;
        }
    }
    
    return kJSQMessagesCollectionViewCellLabelHeightDefault;
}

- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.0f;
}

#pragma mark - Responding to collection view tap events

- (void)collectionView:(JSQMessagesCollectionView *)collectionView
                header:(JSQMessagesLoadEarlierHeaderView *)headerView didTapLoadEarlierMessagesButton:(UIButton *)sender
{
    NSLog(@"Load earlier messages!");
}



- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapMessageBubbleAtIndexPath:(NSIndexPath *)indexPath
{
    [self.inputToolbar.contentView.textView resignFirstResponder];
    NSLog(@"Tapped message bubble!");
    JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.row];
    
    if (message.isMediaMessage) {
        id<JSQMessageMediaData> mediaItem = message.media;
        
        if ([mediaItem isKindOfClass:[JSQPhotoMediaItem class]]) {
            
            NSLog(@"Tapped photo message bubble!");
            JSQPhotoMediaItem *photoItem = (JSQPhotoMediaItem *)mediaItem;
            [self popupImage:photoItem.image];
        }
    }
}

- (void) popupImage:(UIImage*)image
{
    
    UIImageView *bigImageButton = [[UIImageView alloc]initWithImage:image];
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
    imageInfo.image = bigImageButton.image;
    imageInfo.referenceRect = bigImageButton.frame;
    imageInfo.referenceView = bigImageButton.superview;
    imageInfo.referenceContentMode = bigImageButton.contentMode;
    imageInfo.referenceCornerRadius = bigImageButton.layer.cornerRadius;
    
    // Setup view controller
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                           initWithImageInfo:imageInfo
                                           mode:JTSImageViewControllerMode_Image
                                           backgroundStyle:JTSImageViewControllerBackgroundOption_Scaled];
    
    // Present the view controller.
    [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
}

- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapCellAtIndexPath:(NSIndexPath *)indexPath touchLocation:(CGPoint)touchLocation
{
    [self.inputToolbar.contentView.textView resignFirstResponder];
    
    NSLog(@"Tapped cell at %@!", NSStringFromCGPoint(touchLocation));
}
- (void) handleCollectionTapRecognizer:(UITapGestureRecognizer*)recognizer
{
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"tapped");
        if([self.inputToolbar.contentView.textView isFirstResponder])
            [self.inputToolbar.contentView.textView resignFirstResponder];
    }
}

#pragma mark - JSQMessagesComposerTextViewPasteDelegate methods

- (BOOL)composerTextView:(JSQMessagesComposerTextView *)textView shouldPasteWithSender:(id)sender
{
    if ([UIPasteboard generalPasteboard].image) {
        // If there's an image in the pasteboard, construct a media item with that image and `send` it.
        JSQPhotoMediaItem *item = [[JSQPhotoMediaItem alloc] initWithImage:[UIPasteboard generalPasteboard].image];
        JSQMessage *message = [[JSQMessage alloc] initWithSenderId:self.senderId
                                                 senderDisplayName:self.senderDisplayName
                                                              date:[NSDate date]
                                                             media:item];
        [self.demoData.messages addObject:message];
        [self finishSendingMessage];
        return NO;
    }
    return YES;
}

#pragma mark - JSQMessagesViewAccessoryDelegate methods
- (void)didPressAccessoryButton:(UIButton *)sender
{
    STEmojiKeyboard *keyboard = [STEmojiKeyboard keyboard];
    keyboard.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(245/255.0) blue:(252/255.0) alpha:1];
     keyboard.textView = self.inputToolbar.contentView.textView;
    if (sender.tag == 1){
        self.inputToolbar.contentView.textView.inputView = nil;
        [self.inputToolbar.contentView.leftBarButtonItem setImage:[UIImage imageNamed:@"Forma 1.png"] forState:UIControlStateNormal];

            }
    else{
        [keyboard setTextView:self.inputToolbar.contentView.textView];
        [self.inputToolbar.contentView.leftBarButtonItem setImage:[UIImage imageNamed:@"btn_keyboard@2x.png"] forState:UIControlStateNormal];
   
    }
    [self.inputToolbar.contentView.textView reloadInputViews];
    sender.tag = (sender.tag+1)%2;
    [self.inputToolbar.contentView.textView becomeFirstResponder];
    


}




- (void)didPressCameraButton:(UIButton *)sender
{
    [self.inputToolbar.contentView.textView resignFirstResponder];
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerController animated:YES completion:nil];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Choose from Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:nil];
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

#pragma ImagePickerCOntorller -delegate
    -(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
        
       [self.demoData addPhotoMediaMessage:[info objectForKey:UIImagePickerControllerOriginalImage]];
        [picker dismissViewControllerAnimated:YES completion:nil];
         [self finishSendingMessageAnimated:YES];
    }



@end
