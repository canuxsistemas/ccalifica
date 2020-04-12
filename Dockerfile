FROM ruby:2.7.1
RUN mkdir /califica
Workdir califica
copy Gemfile /califica/Gemfile
RUN bundle install
copy . /califica