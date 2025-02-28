# Use docker image ruby33 to build the image

FROM ruby:3.3.6-alpine

WORKDIR /tdd-kata/main

ENV BUNDLE_APP_CONFIG=/tdd-kata/.bundle

ARG BUNDLE_I_FLAGS="--without development:test"

COPY ./Gemfile* ./

# Install bundler
RUN gem install bundler

RUN bundle install $BUNDLE_I_FLAGS

COPY ./ ./

# main.rb is a never ending process.
CMD ["ruby", "-e", "while true do sleep 10 end"]
