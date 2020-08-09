FROM schoolofdevops/carts-maven

WORKDIR /opt/carts

COPY . .

RUN mvn package -DskipTests \
    && mv target/carts.jar /run \
    && rm -r /opt/carts/* 

EXPOSE 80

CMD java -jar /run/carts.jar --port=80 