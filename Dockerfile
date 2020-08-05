From debian:10

COPY runmeindebian.sh /

RUN chmod +x /runmeindebian.sh

CMD /runmeindebian.sh
