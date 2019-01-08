FROM postgres:11.1

## Set the locale
RUN sed -i -e 's/# tr_TR.UTF-8 UTF-8/tr_TR.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG tr_TR.UTF-8
ENV LANGUAGE tr_TR:tr
ENV LC_ALL tr_TR.UTF-8


## Set the time
ENV TZ=Europe/Istanbul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \
  apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata