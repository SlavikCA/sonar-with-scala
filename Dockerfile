FROM mwizner/sonarqube-scala-plugins:latest AS scala_plugins

FROM sonarqube:9.9.1-community

USER root

# Remove any Scala plugins bundled in the base image (if present)
RUN rm -f /opt/sonarqube/lib/extensions/sonar-scala* || true

# Copy Scala plugins from the plugins image
COPY --from=scala_plugins /opt/sonarqube/extensions/plugins/ /opt/sonarqube/extensions/plugins/


# Optionally bake in a custom sonar.properties (uncomment if you want it in the image)
# COPY conf/sonar.properties /opt/sonarqube/conf/sonar.properties
# RUN chown    sonarqube:sonarqube /opt/sonarqube/conf/sonar.properties
RUN chown -R sonarqube:sonarqube /opt/sonarqube/extensions/plugins

USER sonarqube

# Inherit default CMD ["bin/run.sh"] from base image

EXPOSE 9000
