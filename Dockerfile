FROM amazoncorretto:11.0.18

ENV TZ=America/Mexico_City

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY target/*.jar /workspace/app.jar
COPY ./run.sh run.sh

RUN chmod +x run.sh

ENV PORT=8085

ENTRYPOINT ["./run.sh", "$PORT"]