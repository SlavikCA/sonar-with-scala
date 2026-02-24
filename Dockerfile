FROM sonarqube:9.9.1-community

ENV SONAR_SCALA_VERSION 9.0.0
ENV ORACLE_JDBC_VERSION 21.9.0.0

# 1. Remove old scala plugins (if any)
# 2. Download the Scala plugin
# 3. Download the Oracle JDBC driver to the extensions/jdbc folder
# 4. Fix ownership and permissions for both plugins and the jdbc driver
RUN rm -f $SONARQUBE_HOME/lib/extensions/sonar-scala* && \
  wget -O "${SQ_EXTENSIONS_DIR}/plugins/sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" \
  "https://s01.oss.sonatype.org/content/repositories/releases/com/sonar-scala/sonar-scala_2.13/${SONAR_SCALA_VERSION}/sonar-scala_2.13-${SONAR_SCALA_VERSION}-assembly.jar" && \
  wget -O "${SQ_EXTENSIONS_DIR}/jdbc/oracle/ojdbc11-${ORACLE_JDBC_VERSION}.jar" \
  "https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc11/${ORACLE_JDBC_VERSION}/ojdbc11-${ORACLE_JDBC_VERSION}.jar"

EXPOSE 9000
