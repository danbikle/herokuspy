#!/bin/bash

# publish2web.bash

# This script should publish new predictions to web.

cp  ${DDATA}/learn_test.png $STATICF
cat ${DDATA}/learn_test.csv|awk -F, '{print $1","$2","$10","$11}' |sed '1,$s/1.000$/1/' > ${STATICF}/predictions.csv
# I should add some html
cd ${HEROKUSPY}/hello/templates
echo '<h1>Predictions</h1>'      > predictions.html
echo '<pre class="pcsv"><code>' >> predictions.html
cat ${STATICF}/predictions.csv  >> predictions.html
echo '</code></pre>'            >> predictions.html

# cp base_empty.html                           base.html
# sed -i '/predictionsHere/r predictions.html' base.html
# I should publish the changes
cd $HEROKUSPY
git commit -am herokuspyRan
git push heroku master

exit

