#!/bin/bash

# noon50.bash
. ${HOME}/pyspy/pyspy_env.bash
. ${HOME}/herokuspy/herokuspy_env.bash
  ${HOME}/pyspy/bin/noon50.bash
cp ${DDATA}learn_test.png $STATICF
# I should publish the changes
cd $HEROKUSPY
git commit -am noon50ran
git push heroku master

exit

