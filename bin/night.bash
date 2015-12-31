#!/bin/bash

# night.bash
. ${HOME}/pyspy/pyspy_env.bash
. ${HOME}/herokuspy/herokuspy_env.bash
${PYSPY}/bin/night.bash

${HEROKUSPY}/bin/publish2web.bash

exit
