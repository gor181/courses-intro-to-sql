git clone https://$GITHUB_TOKEN@github.com/datacamp/courses-intro-to-sql.git

service postgresql start \
  && sudo -u postgres createdb -O repl films \
  && cd courses-intro-to-sql \
  && sudo -u postgres psql films < data/films/films.sql \
  && service postgresql stop
