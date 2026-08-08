FROM ghcr.io/openclaw/openclaw:latest

USER node

CMD ["sh", "-lc", "openclaw config set gateway.mode local && openclaw config set gateway.http.endpoints.chatCompletions.enabled true && exec openclaw gateway --bind lan --port ${OPENCLAW_GATEWAY_PORT:-8080}"]
