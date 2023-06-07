FROM amazoncorretto:11.0.18

ARG APP_PORT

ENV TZ=America/Mexico_City
ENV APP_PORT=${PORT}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY target/*.jar /workspace/app.jar
COPY ./run.sh run.sh

RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]
CMD ["$APP_PORT"]
