Libraries Required -

We have mostly used the sklearn library which is pre-installed in Anaconda's Spyder IDE. 
Other libraries are pandas,numpy,nolearn.dbn.

To install - 

Eg - pip install nolearn



Support Vector Machine & Neural Network - 

    Data files - 

	- train.csv = This file contains only the pixel values without any labels or column headers. This was done for easier input reading. The corresponding labels are stored in train_labels.csv. Total number - 42000
	
 	-test.csv = This file contains the unlabeled pixel values without column headers. Total number - 28000

   
   Code files -

        - Gridsearch.py - Used to find the hyperparameters C & gamma for SVM.
        - SVM_train.py - Used to train the model and test the hyperparameters obtained using grid search splitting the 42000 values into train & test set and seeing the confusion matrix,f-1 score,accuracy values.
        - SVM.py - Used to train the model on the 42000 values and test it on the 28000 values outputting a file SVM_results.csv which conforms to the format required by kaggle submission.
	- Neural network_train.py - Used to train a neural network of 2 layers with 300 hidden units & 10 iterations,splitting the 42000 values into train & test set and seeing the confusion matrix,f-1 score,accuracy values.
	- Neural network.py - Used to train the model on the 42000 values and test it on the 28000 values outputting a file Neural network_results.csv which conforms to the format required by kaggle submission.


K- Nearest Neighbors -
 
   Data files - 

 	-train1.csv & test1.csv = Standard data files as provided on the Blackboard & Kaggle data.

    
   Code file -
  
        -KNN.py - This file performs PCA on the data and then runs for different values of k=[3,5,10,20]. It outputs the one with highest accuraccy as KNN_results.csv



Gradient Descent - 

    Data files - 

 	-train1.csv = Standard data file as provided on the Blackboard & Kaggle data.


    Code file - 
 
       -Stochastic Gradient descent.py - This file uses the Gradient descent method to classify digits.