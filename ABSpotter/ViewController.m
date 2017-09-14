//
//  ViewController.m
//  ABSpotter
//
//  Created by Abilash Cumulations on 12/09/17.
//  Copyright © 2017 Abilash. All rights reserved.
//

#import "ViewController.h"
#import "SpotterAnalyzer.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    __weak IBOutlet UIImageView *imageVw;
    __weak IBOutlet UIButton *processImage;
    __weak IBOutlet UIButton *pickImage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    processImage.hidden = true;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}


- (void)camera {
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        return;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    //Permetto la modifica delle foto
    picker.allowsEditing = false;
    //Imposto il delegato
    [picker setDelegate:self];
    
    [self presentViewController:picker animated:true completion:nil];
}
- (void)library {
    //Inizializzo la classe per la gestione della libreria immagine
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //Permetto la modifica delle foto
    picker.allowsEditing = false;
    //Imposto il delegato
    [picker setDelegate:self];
    
    [self presentViewController:picker animated:true completion:nil];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:true completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [picker dismissViewControllerAnimated:true completion:nil];
        //extracting image from the picker and saving it
        NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
        if ([mediaType isEqualToString:@"public.image"]){
            imageVw.image = [info valueForKey:UIImagePickerControllerOriginalImage];
            processImage.hidden = false;
        }
    });

}

#pragma mark -  Click Events
- (IBAction)didClickOnImagePicker:(id)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Image Picker" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [actionSheet dismissViewControllerAnimated:true completion:nil];
            [self camera];
        }]];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Photo Gallary" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [actionSheet dismissViewControllerAnimated:true completion:nil];
            [self library];
        }]];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [actionSheet dismissViewControllerAnimated:true completion:nil];
            
        }]];
        [self presentViewController:actionSheet animated:true completion:nil];
 
    });
}



- (IBAction)didClickOnProcessImage:(id)sender
{
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    [[SpotterAnalyzer sharedAnalyzer]processImage:imageVw.image];
    });
}


@end
