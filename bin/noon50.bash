#!/bin/bash

# noon50.bash
. ${HOME}/pyspy/pyspy_env.bash
. ${HOME}/herokuspy/herokuspy_env.bash
${PYSPY}/bin/noon50.bash

${HEROKUSPY}/bin/publish2web.bash

exit
