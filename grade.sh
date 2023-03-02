CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'  
cd student-submission


if [[ -f ListExamples.java ]] 
then 
    echo "ListExamples found" 
else 
    echo "ListExamples not found" 
    exit 1 
fi 

cd ..
cp TestListExamples.java student-submission 
cp -r lib student-submission
cd student-submission 



javac ListExamples.java 

if [[ $? -eq 0 ]] 
then  
    echo "Compilation Successful"  
else 
    echo "Compilation Unsuccesful" 
    exit 1 
fi  

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > results.txt

grep "Exception" results.txt > grade.txt
head -n 2 results.txt > output.txt
grep "E" -o output.txt | wc -l  > plswork.txt
grep . -o output.txt | wc -l  > plswork2.txt