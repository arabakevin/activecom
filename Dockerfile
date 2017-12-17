# ~~~~ Image base ~~~~
FROM ruby:2.4.1-slim
MAINTAINER zedtux, zedtux@zedroot.org

ENV DEBIAN_FRONTEND noninteractive

# ~~~~ System locales ~~~~
RUN apt-get update && apt-get install -y locales && \
  dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8 && \
  echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV APP_HOME /application

# ~~~~ Application dependencies ~~~~
RUN apt-get update && \
    apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && \
    apt-get install -y libpq-dev \
                       build-essential \
                       nodejs

# ~~~~ Bundler ~~~~
RUN gem install bundler

WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
COPY *.gemspec $APP_HOME/
COPY lib/activecom/version.rb $APP_HOME/lib/activecom/

# ~~~~ Install Rails application gems ~~~~
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=8 \
  BUNDLE_PATH=/bundle

RUN gem install rubygems-update --no-ri --no-rdoc --version 2.7.0 && \
    update_rubygems

RUN bundle install

# ~~~~ Import application ~~~~
COPY . $APP_HOME

VOLUME .:$APP_HOME

ENTRYPOINT ["bundle", "exec"]
CMD ["rake", "-T"]
