# Letter-detection-
After performing Gaussian smoothing, we binarized our image to separate foreground and background
pixels in our image. We tried with several different threshold value to obtain the optimum value suitable
for our purpose. We performed a square dilation over the image with size 2, because we saw some gaps
in some of the individual letters.


However, when we perform the dilation, so as to cover up the gaps in some letters, we end up merging
some other letters,So, if we perform dilation concerning that our one letter will be filled, may be it leads
to joining of other letters.


Later on, we cropped the individual letter ‘a’ as our kernel. It can be seen it in our individual figure
We stored our 4-connected connected components in the label matrix L using bwlabel function.
However in some of the letters, there was still some separation i.e .two different letters were being
merged in some of the alphabet extraction. We tried to overcome it by adjusting our parameters by
smoothing and filling but there was always some merging or separation in the individual alphabet
extraction.

We get our max correlation value, when we apply kernel with the exact alphabet as kernel extracted
from the binarized image.


Then later on, we applied further apply this kernel over our image by extracting each individual letter
and performing the ‘corr’ filtering with the kernel. We manually adjusted our threshold to be 90%(0.9)
of your Ideal threshold value i.e. the max value .Then comparing with the max value obtained after the
‘corr’ filtering by the kernel and each extracted letter.
We were almost able to identify the correct letter. The result can be seen it in the output itself.

SAMPLE IMAGE
![text_train](https://user-images.githubusercontent.com/23450113/50497200-e7cc9680-0a35-11e9-9ddb-4cf798e1ec53.jpg)

EXTRACT THE KERNEL FROM THE INPUT IMAGE
![cropped](https://user-images.githubusercontent.com/23450113/50497202-ea2ef080-0a35-11e9-9a03-12dfbb128a34.jpg)

PERFORM DILATION TO FILL THE GAPS TO MAXIMISE THE MATCH
![dilated_image](https://user-images.githubusercontent.com/23450113/50497204-ebf8b400-0a35-11e9-98a2-ef35ef78893b.jpg)

FINAL OUTPUT
![output](https://user-images.githubusercontent.com/23450113/50497205-edc27780-0a35-11e9-9d35-7de0ae6117a0.jpg)
