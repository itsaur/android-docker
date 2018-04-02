
FROM ubuntu:latest

RUN cd /opt

RUN mkdir android-sdk-linux && cd android-sdk-linux/

RUN apt-get update -qq \
  && apt-get install -y openjdk-8-jdk \
  && apt-get install -y wget \
  && apt-get install -y expect \
  && apt-get install -y zip \
  && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*


RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip

RUN unzip sdk-tools-linux-3859397.zip -d /opt/android-sdk-linux

RUN rm -rf sdk-tools-linux-3859397.zip

ENV ANDROID_HOME /opt/android-sdk-linux
RUN echo yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-27"
RUN echo yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-P"

RUN echo yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-26"
RUN echo yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-27"

RUN echo yes | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;28.0.0-rc1"

RUN mkdir "$ANDROID_HOME/licenses" || true
RUN echo -e "\nd56f5187479451eabf01fb78af6dfcb131a6481e" > "$ANDROID_HOME/licenses/android-sdk-license"
RUN echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"

RUN apt-get clean

RUN chown -R 1000:1000 $ANDROID_HOME

VOLUME ["/opt/android-sdk-linux"]

RUN mkdir -p /android

WORKDIR /android

ADD ./ /android
