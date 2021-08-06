FROM mysql:8.0.19

# copy our initialization scripts to the initdb.d folder
# so they will get run automatically on creation
COPY ./init_scripts/ /docker-entrypoint-initdb.d/
