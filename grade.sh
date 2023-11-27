CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

set -e
if [[ -f ./student-submission/ListExamples.java ]]
then 
    cp -r ./student-submission/ListExamples.java ./grading-area/
    cp -r TestListExamples.java ./grading-area/
    cp -r ./lib ./grading-area/
    echo "It worky worky"

    # javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
    # java -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" org.junit.runner.JunitCore ListExamples
    javac -cp $CPATH ./grading-area/*.java
    java -cp $CPATH org.junit.runner.JUnitCore ./grading-area/TestListExamples > error.txt
    cat "error.txt"
else
    echo "Did NOT copy correctly womp womp :(" 
fi
exit 


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
