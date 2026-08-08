FROM ghcr.io/openclaw/openclaw:latest

USER node

CMD ["sh", "-lc", "openclaw config set gateway.mode local && exec openclaw gateway --bind lan --port ${OPENCLAW_GATEWAY_PORT:-8080}"]
