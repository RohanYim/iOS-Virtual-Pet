What's new

· Create your own pet:

By clicking "Add My Pet", we will be able to upload your own image and set your pet's happy level and feed level. After all set, by clicking "submit", you will have your own pet. When done, you will be able to see your pet by clicking "My Pet", you can feed or play with it as well.
	· Invalid check: if you didn't upload the right image or input the wrong level, after clicking "submit" you will get a warning.
	· Class protect: you wouldn't be able to "play" or "feed" if your pet is not yet created.

How do we implement it?
1. Add the delegate protocol: UIImagePickerControllerDelegate,UINavigationControllerDelegate
2. Initialize the image picker controller: UIImagePickerController()
3. After picking the image, set image in imageview to the picked picture
4. Update "myPet" class


Reference:
1. https://www.youtube.com/watch?v=J86_F7_exfE
2. https://www.youtube.com/watch?v=xT6AeX86Kpo
