#  RoyaleAUV3Host

A Simple yet powerfull iOS app to display a list of the AUv3 plugins on your device.

This project **DOES NOT USE** Storyboards or UIKit. **it's 100% SwiftUI and swift based.**

## About this project

I'm very new to the Apple ecosystem and I struggled to find a way not to use Storyboards or older architectures. All the project related to AUv3 hosting  I found relied on UIKit and StoryBoards, something I think that will eventually disappear. 

And I did not want to put a finger there since I already have a great deal of things to learn just using Swift...

So I wish to thank everybody that shared projects (you rock guys!), and here's my little contribution to the community.


##  Important Thing I learnt the hard way

By default you can use the API to load Auv3 plugins. However you will **only fetch Apple plugins** unless you add the following info in your entitlements :

```    
<key>inter-app-audio</key>
<true/>
```

Don't ask me why. But this tiny detail just drove me crazy.



## License

The MIT License (MIT)
Copyright (c) [2025] [François Nicaise]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

