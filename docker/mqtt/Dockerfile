FROM eclipse-mosquitto:latest

COPY ./mosquitto.conf /etc/mosquitto/mosquitto.conf

# MQTT Port
EXPOSE 1883

# WebSocket Port
EXPOSE 9001

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]