//
//  AuthViewController.m
//
//  Copyright (c) 2016 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "FIRCustomPasswordSignInViewController.h"

@interface FIRCustomPasswordSignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation FIRCustomPasswordSignInViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil
                         bundle:(nullable NSBundle *)nibBundleOrNil
                         authUI:(FIRAuthUI *)authUI
                          email:(NSString *_Nullable)email {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil authUI:authUI email:email];

  if (self) {
    _emailTextField.text = _email;
  }
  return self;
}

- (IBAction)onForgotPasswordPressed:(id)sender {
  [self forgotPasswordForEmail:_emailTextField.text];
}

- (IBAction)onNextPressed:(id)sender {
  [self signInWithEmail:_emailTextField.text andPassword:_passwordTextField.text];
}

- (IBAction)onCancelPressed:(id)sender {
  [self cancelAuthorization];
}

- (IBAction)onBackPressed:(id)sender {
  [self onBack];
}

- (IBAction)onViewSelected:(id)sender {
  [_emailTextField resignFirstResponder];
  [_passwordTextField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  if (textField == _emailTextField) {
    [_passwordTextField becomeFirstResponder];
  } else if (textField == _passwordTextField) {
    [self onNextPressed:nil];
  }

  return NO;
}

@end