FROM python:3.11

# don't use root, let's not have FTS be used as a priv escalation in the wild
RUN groupadd -r freetak && useradd -m -r -g freetak freetak
RUN mkdir /opt/fts ; chown -R freetak:freetak /opt/fts ; chmod 775 /opt/fts ; chmod a+w /var/log

USER freetak

# This needs the trailing slash
ENV FTS_DATA_PATH="/opt/fts/"

# Move to the FTS directory, then do the copying and unpacking
WORKDIR /home/freetak/
# COPY --chown=freetak:freetak --chmod=774 README.md pyproject.toml docker-run.sh ./
COPY --chown=freetak:freetak --chmod=774 README.md pyproject.toml poetry.lock docker-run.sh ./
COPY --chown=freetak:freetak --chmod=774 FreeTAKServer/ ./FreeTAKServer/

# Install pre-reqs then the base FTS
# ruamel.yaml is very ornery and has to be force-reinstalled alone

# Establecer PATH para encontrar poetry
ENV PATH="/home/freetak/.local/bin:$PATH"

# Instala poetry correctamente como usuario no-root
RUN pip install --upgrade pip && pip install --force-reinstall "ruamel.yaml<0.18" --user && pip install poetry --user

# Copia los archivos de dependencias
COPY pyproject.toml poetry.lock ./

# Instala las dependencias
# RUN poetry install --no-root

VOLUME /opt/fts

CMD [ "/home/freetak/docker-run.sh" ]
