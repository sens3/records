# heavily influenced by http://www.leonardoborges.com/writings/2012/05/03/build-automation-with-xcode-4-dot-3-kif-and-jenkins/

#!/bin/bash

killall "iPhone Simulator"
rm /tmp/KIF-*

echo "Build the project"
xcodebuild -scheme "RecordsIntegrationTests" -configuration Debug -sdk iphonesimulator clean build

OUT_FILE=/tmp/KIF-$$.out
# Run the app we just built in the simulator and send its output to a file
# /path/to/MyApp.app should be the relative or absolute path to the application bundle that was built in the previous step
echo "Running KIF tests"
ios-sim launch "DerivedData/Records/Build/Products/Debug-iphonesimulator/Records (Integration Tests).app" > $OUT_FILE 2>&1

# WaxSim hides the return value from the app, so to determine success we search for a "no failures" line
grep -q "TESTING FINISHED: 0 failures" $OUT_FILE

success=`exec grep -c "TESTING FINISHED: 0 failures" $OUT_FILE`


# if there was a failure, show what ios-sim was hiding and crucially return with a non-zero exit code
if [ "$success" = '0' ]
then 
    cat $OUT_FILE
    echo "==========================================="
    echo "GUI Tests failed"
    echo "==========================================="
    exit 1
else
    echo "==========================================="
    echo "GUI Tests passed"
    echo "==========================================="
fi