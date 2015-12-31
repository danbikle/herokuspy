#!/bin/bash

# noon50.bash
. ${HOME}/pyspy/pyspy_env.bash
. ${HOME}/herokuspy/herokuspy_env.bash
${PYSPY}/bin/noon50.bash
cp  ${DDATA}/learn_test.png $STATICF
cat ${DDATA}/learn_test.csv|awk -F, '{print $1","$2","$10","$11}' |sed '1,$s/1.000$/1/' > ${STATICF}/predictions.csv

# I should add some html
cd ${HEROKUSPY}/hello/templates
echo '<pre class="pcsv"><code>' > predictions.html
echo '<h1>Predictions</h1>'    >> predictions.html
cat ${STATICF}/predictions.csv >> predictions.html
echo '</code></pre>'           >> predictions.html
exit

cp base_empty.html                           base.html
sed -i '/predictionsHere/r predictions.html' base.html
# I should publish the changes
cd $HEROKUSPY
git commit -am noon50ran
git push heroku master

exit

