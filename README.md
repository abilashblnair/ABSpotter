# ABSpotter (Deep Learning - Image regonization)

Real time image name detection demo App with ABSpotter for iOS based on Tensorflow

# Dependencies

[Tensorflow](https://github.com/tensorflow/tensorflow)

[Objective C](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)


# Running the Samples using CocoaPod

You'll need Xcode 7.3 or later.

Change directory to one of the samples, download the TensorFlow-experimental pod, and open the Xcode workspace. Observe: installing the pod can take a long time since it is big (~450MB). For example, if you want to run the simple example, then:

# Do following:

```
cd ABSpotter
pod install
open ABSpotter.xcworkspace # obs, not the .xcodeproj directory

```

# Troubleshooting

Make sure you use the TensorFlow-experimental pod (and not TensorFlow).
 
The TensorFlow-experimental pod is current about ~450MB. The reason it is so big is because we are bundling multiple platforms, and the pod includes all TensorFlow functionality (e.g. operations). The final app size after build is substantially smaller though (~25MB). Working with the complete pod is convenient during development, but see below section on how you can build your own custom TensorFlow library to reduce the size.

# Building the TensorFlow iOS libraries from source

You'll need Xcode 7.3 or later, with the command-line tools installed.

Follow the instructions at [tensorflow/contrib/makefile](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/contrib/makefile) under "iOS" to compile a static library containing the core TensorFlow code.

You should see a single-screen app with a "Run Model" button. Tap that, and you should see some debug output appear below indicating that the example Grace Hopper image has been analyzed, with a military uniform recognized.

Once you have success there, make sure you have a real device connected and
   open up the Xcode project. Once you build and run
   that, you should get a live camera view that you can point at objects to get image recognition results.
