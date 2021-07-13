FROM openjdk:8-jre
WORKDIR /app
VOLUME ["/app", "/tmp"]
RUN mkdir -p /run_as_user_can_write_here
RUN chmod -R 777 /run_as_user_can_write_here
VOLUME ["/run_as_user_can_write_here"] # this avoids READ-ONLY files system block set by securityContext.readOnlyRootFilesystem
ARG UNAME=testuser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
COPY app.jar app.jar
RUN sh -c 'touch app.jar'
USER $UNAME
ENTRYPOINT ["/bin/sh", "-c", "sleep 1000 && java -Djava.security.egd=file:/dev/./urandom -jar app.jar"]
