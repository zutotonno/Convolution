# Convolution of a SOBEL filter
Different ways of implementing Convolution of a Sobel filter over an Image
## What is Convolution of a Kernel Filter
Convolution of a filter (or kernel) is the process of adding each element of the image to its local neighbors, weighted by the kernel.
Depending on the features we want to extract from the image, it is important to choose the right kernel. 

- If the kernel is symmetric then place the center (origin) of kernel on the current pixel. Then kernel will be overlapped with neighboring pixels too. Now multiply each kernel element with the pixel value it overlapped with and add all the obtained values. Resultant value will be the value for the current pixel that is overlapped with the center of the kernel.

- If the kernel is not symmetric, it has to be flipped both around its horizontal and vertical axis before calculating the convolution as above, otherwise we're doing Correlation not Convolution.

For example, if we want to exctract edges what we want is to check where the image quickly changes its intensity value, because in these region we're probably also changing the texture of the object. The most famous filter used for edge detection is the SOBEL filter.

The SOBEL operator uses two 3×3 kernels which are convolved with the original image to calculate approximations of the derivatives – one for horizontal changes (Gx) , and one for vertical (Gy).
\
<img src="https://nrsyed.com/wp-content/uploads/2018/08/sobel_G-230x300.png"/>

### The first way is what i call "Wikipedia Code"
The name talk for itself, and the code is referring to *SOBEL_WIKI.m*
### The second way is to make only the computation needed
We can start from *SOBEL_WIKI*, but doing only the math operation we actually need. For example we can avoid useless operation of multiplying by zero or by +-1. The code is referring to *SOBEL_ANTO.m*
### The third way is avoiding doing convolution while sliding over image
We can re-arrange our image as a matrix with each column a small window of the size of the filter (in this case 9 -> 3x3), and as row the number of sliding we can make over the image. Then we can do a single Matrix multiplication between the image (Mx9) and the Sobel filter (9x1). The code is referring to *SOBEL_ANTO_OPTIM.m*
### The last way i came up is to make the same thing as before but using an OpenCV library to make the matrix re-arrangement
 In order to avoid every single for-loop we can use the im2col OpenCV function that takes as input the actual image, the size of the filter we want to later apply, and the way of threating the padding and outputs the same Mx9 matrix seen before. Then we can do the usual matrix multiplication. The code is referring to *SOBEL_ANTO_OPTIM_VER2.m*
 ### This four tries are compared in terms of computational time resulting in the table below:

