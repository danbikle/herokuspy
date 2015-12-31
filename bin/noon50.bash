#!/bin/bash

# noon50.bash
. ${HOME}/pyspy/pyspy_env.bash
. ${HOME}/herokuspy/herokuspy_env.bash
${PYSPY}/bin/noon50.bash
cp  ${DDATA}/learn_test.png $STATICF
cat ${DDATA}/learn_test.csv|awk -F, '{print $1","$2","$10","$11}' |sed '1,$s/1.000$/1/' > ${STATICF}/predictions.csv
# I should publish the changes
cd $HEROKUSPY
git commit -am noon50ran
git push heroku master

exit

