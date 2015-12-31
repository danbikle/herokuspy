#!/bin/bash

# night.bash
. ${HOME}/pyspy/pyspy_env.bash
. ${HOME}/herokuspy/herokuspy_env.bash
${PYSPY}/bin/night.bash
cp ${DDATA}/learn_test.png $STATICF
# I should publish the changes
cd $HEROKUSPY
git commit -am nightran
git push heroku master

exit

