#!/bin/bash

# Instala las dependencias en tiempo de ejecución (por si build fue limpio)
poetry install --no-root

# Activar entorno virtual de poetry
source $(poetry env info --path)/bin/activate

# Sharing for FTSConfig.yaml
if [[ ! -f "/opt/fts/FTSConfig.yaml" ]]
  then
    python -c "from FreeTAKServer.core.configuration.configuration_wizard import autogenerate_config; autogenerate_config()"
fi

python -m FreeTAKServer.controllers.services.FTS
