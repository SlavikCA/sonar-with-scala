FROM sonarqube:9.9.1-community

ENV SONAR_SCALA_VERSION 9.0.0

RUN rm $SONARQUBE_HOME/lib/extensions/sonar-scala* && \
  wget -O "${SQ_EXTENSIONS_DIR}/plugins/sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
  "https://s01.oss.sonatype.org/content/repositories/releases/com/sonar-scala/sonar-scala_2.13/${SONAR_SCALA_VERSION}/sonar-scala_2.13-${SONAR_SCALA_VERSION}-assembly.jar" && \
  chown sonarqube:sonarqube $SQ_EXTENSIONS_DIR/plugins/sonar-scala-plugin-* && \
  chmod 777 $SQ_EXTENSIONS_DIR/plugins/sonar-scala-plugin-*

EXPOSE 9000
