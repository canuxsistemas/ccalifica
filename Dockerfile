FROM ruby:2.7.1
RUN apt update && apt install -y nodejs build-essential git bash vim nano 
RUN wget http://www.freetds.org/files/stable/freetds-1.1.tar.gz
RUN tar -xzf freetds-1.1.tar.gz
RUN cd freetds-1.1 && ./configure --prefix=/usr/local --with-tdsver=7.3 && make && make install
RUN mkdir /califica
WORKDIR /califica
COPY Gemfile /califica/Gemfile
COPY config/database.yml /califica/config/database.yml
RUN bundle install
COPY . /califica
EXPOSE 3000
CMD ["rails","server","-b","0.0.0.0"]