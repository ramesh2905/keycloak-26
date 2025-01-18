FROM quay.io/keycloak/keycloak:26.0.6 AS builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=mssql
ENV KC_DB_DRIVER=com.microsoft.sqlserver.jdbc.SQLServerDriver
ENV KC_TRANSACTION_XA_ENABLED=true

# Features
ENV KC_FEATURES=hostname:v2

# HTTP Relative path
ENV KC_HTTP_RELATIVE_PATH=/auth 
ENV KC_HTTP_MANAGEMENT_RELATIVE_PATH=/management
ENV KC_PROXY_HEADERS=forwarded

# Copy MSSQL JDBC jar
ADD --chown=root:root jdbc/mssql/mssql-jdbc-12.8.1.jre11.jar /opt/keycloak/providers/mssql-jdbc.jar

FROM quay.io/keycloak/keycloak:26.0.6 
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
