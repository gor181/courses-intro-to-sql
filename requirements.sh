some test
BASE_DIR=$(pwd)
#NYCBIKES_DATA="https://assets.datacamp.com/course/sql/nycbikes15.zip"
#NYCBIKES_REPO="https://assets.datacamp.com/course/tmp_fixme_filip/nycbikes15_db_scripts.zip"
FILMS_REPO="https://assets.datacamp.com/course/tmp_fixme_filip/films.zip"

apt-get update && apt-get install -y unzip
# get repos
#wget $NYCBIKES_REPO
#unzip nycbikes15_db_scripts.zip

mkdir -p courses-intro-to-sql/data
wget $FILMS_REPO
unzip films.zip -d courses-intro-to-sql/data

#git clone https://$GITHUB_TOKEN@github.com/datacamp/courses-intro-to-sql.git
#git clone https://$GITHUB_TOKEN@github.com/datacamp/nycbikes15.git

# get data for nycbikes15
#wget $NYCBIKES_DATA
#unzip nycbikes15.zip -d ./nycbikes15/data

# build databases
#service postgresql start \
  #&& sudo -u postgres createdb -O repl films \
  #&& sudo -u postgres createdb -O repl nycbikes15 \
  #&& cd courses-intro-to-sql \
  #&& sudo -u postgres psql films < data/films/films.sql \
  #&& cd $BASE_DIR/nycbikes15 \
  #&& sudo -u postgres psql nycbikes15 < sql-setup/create-db-postgres.sql \
  #&& service postgresql stop

pip3 install sqlwhat-ext==0.0.1

service postgresql start \
  && sudo -u postgres createdb -O repl films \
  && cd courses-intro-to-sql \
  && sudo -u postgres psql films < data/films/films.sql \
  && service postgresql stop