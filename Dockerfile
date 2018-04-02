
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

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --update

RUN $ANDROID_HOME/tools/bin/sdkmanager --list

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-7"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-8"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-9"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-10"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-11"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-12"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-13"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-14"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-15"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-16"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-17"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-18"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-19"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-20"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-21"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-22"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-23"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-24"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-25"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-26"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-27"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-P"

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-15"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-16"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-17"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-18"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-19"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-20"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-21"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-22"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-23"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-24"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-25"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-26"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "sources;android-27"

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "patcher;v4"

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;27.0.3"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "build-tools;28.0.0-rc1"

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-15"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-16"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-17"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-18"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-19"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-21"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-22"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-23"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "add-ons;addon-google_apis-google-24"

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "emulator"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "extras;android;m2repository"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "extras;google;google_play_services"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "extras;google;instantapps"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "extras;google;webdriver"
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2"

RUN chown -R 1000:1000 $ANDROID_HOME

VOLUME ["/opt/android-sdk-linux"]

RUN mkdir -p /android

WORKDIR /android

ADD ./ /android
