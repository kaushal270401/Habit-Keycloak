FROM quay.io/keycloak/keycloak:26.1.4

# Copy your custom theme into the image
COPY keycloak-theme-for-kc-22-to-25.jar /opt/keycloak/providers/

# Build the optimized Keycloak image
ENV KC_DB=postgres
ENV KC_FEATURES=organization
ENV KC_HTTP_ENABLED=true

RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
# Use 'start --optimized' to skip the auto-rebuild phase
CMD ["start", "--optimized"]
