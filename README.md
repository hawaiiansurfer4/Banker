# Banker

## Software
* Swift
* iOS
* XCode
* UIKit
* Programatically Creates almost every view
<img width="563" alt="Screen Shot 2022-06-08 at 10 53 03 AM" src="https://user-images.githubusercontent.com/62270910/172651817-7203b180-d517-4586-971d-b5a63e9e483f.png">
<img width="563" alt="Screen Shot 2022-06-08 at 10 53 20 AM" src="https://user-images.githubusercontent.com/62270910/172651842-77daf449-fa8d-4626-8485-7e6cf4fdcd41.png">

<img width="563" alt="Screen Shot 2022-06-08 at 10 53 41 AM" src="https://user-images.githubusercontent.com/62270910/172651878-487f3293-7645-44e5-a630-c2822b64b572.png">

<img width="564" alt="Screen Shot 2022-06-08 at 10 56 24 AM" src="https://user-images.githubusercontent.com/62270910/172651912-743defce-acd5-4794-83aa-3a3ba027bad8.png">

<img width="564" alt="Screen Shot 2022-06-08 at 10 56 33 AM" src="https://user-images.githubusercontent.com/62270910/172651943-331b7049-7cbe-4b62-bcc2-951581f922da.png">

![IMG_3431](https://user-images.githubusercontent.com/62270910/172651970-1515744d-85e0-4bf7-973c-801b5490a01b.jpeg)




## Features
1. Login - Has a login screen that allows you to toggle if you want to see your password as you type it or keep it hidden along with some animations that will improve user experience from animating the title and subtitle sliding in to shaking the login button when an incorrect username and password is typed in along with showing an error message
2. Account Summary View - Summarizes all of the accounts and distingueshes each account not only by name but also by color of a account type underline. This also has stylized the balance information and a skeleton loader where the information area will shimmer while the information is being loaded. 
3. Pull to refresh - Allows the user to pull down to refresh the information and shows the skeleton loader while information is loading

## Unit Tests
* AccountSummaryViewController tests
    - tests the alert error and the messaging error
    - completes a mock request
    - tests if the json for an account is being parse properly 
    - tests if the profile for the user is being parsed properly
