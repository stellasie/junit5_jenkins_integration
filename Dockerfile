FROM jenkins:alpine

EXPOSE 8080

ENV GRADLE_VERSION 2.3
ENV GRADLE_HOME /usr/local/gradle
ENV PATH ${PATH}:${GRADLE_HOME}/bin

# Install gradle
USER root
WORKDIR /usr/local
RUN wget  http://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip && \
    ln -s gradle-$GRADLE_VERSION gradle
USER jenkins
#echo -ne "- with Gradle $GRADLE_VERSION\n" >> /root/.built