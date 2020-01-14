
FROM docker-registry.default.svc:5000/ros2-proj/lg-base-docker:latest

CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"
