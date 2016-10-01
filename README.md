# Pre-work - *Tip*

**Tip** is a tip calculator application for iOS.

Submitted by: **Luis A. Perez**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Continue tip percentage slider.
- [x] Advanced tip stepper.
- [x] Formated tip and total amount.
- [x] Icons for usability
- [x] TableView for settings page
- [x] Tax selection for inclusion in the bill (if subtotal)
- [x] Toggle switch for tax selection
- [x] Ability to modify tip step size by integer
- [x] Ability to specify any initial tip amount.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/DBNLUxk' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
- Synchronizing the step slider and the step trigger proved to be a challange.
- Moving away form the default view to a TableView opened up many possibilities in terms of UI elements, and proved challenging to decided which elements would be the best.
- In terms of design, adding the ability to the user to select any tip amount proved difficult.
- Swift has a lot of syntax that, while familiar, requires specificity. The XCode dot-complete  certainly helped a lot.


## License

    Copyright 2016 Luis A. Perez

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.