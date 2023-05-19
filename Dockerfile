FROM postgres:15

WORKDIR /src

COPY *.sql ./

COPY runner.sh ./

CMD ["postgres"]
