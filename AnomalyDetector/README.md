
# Anomaly Detector
The anomaly detection script is a simple method of detecting likely anomalies within a multidimensional dataset based on a gaussian distribution and determining the highest F-score from a range of possible detection thresholds. Then, the script will return an optimal threshold value, corresponding F-score and a new dataset without the anomalies.

## Usage
1. **Open environment**
	a. Open `anomalyDetector.m` in [MATLAB](au.mathworks.com/products/matlab.html)
	b. A free and open-source alternative is [GNU Octave](https://www.gnu.org/software/octave)
2. **Load data**
	a. *(Optional)* Modify the *load()* function to include the desired dataset as a `.mat` format
	b. Make sure that the example iteration runs along the *x-axis* and the dimensions are the *y-axis*
3. **Run computation**
	a. Using the `data_2d.mat`, the output in the command window should look like
	`Threshold: 		8.990853e-05  
	F1 Score:  			0.875000 
	Outliers found: 	6 `

## Files
- **anomalyDetector.m:** Primary file for running the script. Loads a **.mat** file and outputs the results in the command window
- **gaussianId.m:** Function returns the estimated **average** and **variance** of the a dataset using Gaussian Distribution
- **predictGaussian.m:** Function returns the computed **probability** of each point within the inputted dataset, given the average and variance
- **selectThreshold:** Function returns a **threshold** for the probability that a datapoint is an anomaly with the corresponding F1-score for the threshold 
- **data_2d.mat:** Example 2-dimension dataset 

## Components
The **Gaussian distribution** (normal distribution) is a formula for the likelihood for a particu4lar value to be a part of a dataset. The distribution can be described using two variables which is it's mean *$\mu$*, and its variance *$\sigma^{2}$* in the following:

$$
  X \sim \mathcal{N}(\mu,\,\sigma^{2})\,.
$$
 The **F1-score** is a averaged computation between *precision (P\)* and *recall (R\)* in an algorithm's performance. Precision and recall are important metrics in a learning algorithm as they capture inefficiencies caused by skewed data shown in the count of *True Positives (TP), False Positives (FP)* and *False Negatives (FN)*.
 $$P = \frac{TP}{TP+FP
} $$ 
 $$R = \frac{TP}{TP+FN
} $$ 
 $$F1 = 2\frac{PR}{P+R
} $$ 
 
## Limitation
The decision bounds of a normal distribution on one axis is between two points. This limits the effectiveness for any distribution that does not fit a normal curve, such as a distribution with two peaks or skewed data. A future solution could include a gradient descent to find the most suitable boundaries.