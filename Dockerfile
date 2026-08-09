FROM ghcr.io/openclaw/openclaw:latest

USER root

COPY workspace/openflow-immo /opt/openflow-immo-template

RUN chown -R node:node /opt/openflow-immo-template

USER node

CMD ["sh", "-lc", "mkdir -p /data/workspace/openflow-immo && cp -R /opt/openflow-immo-template/. /data/workspace/openflow-immo/ && openclaw config set gateway.mode local && openclaw config set gateway.http.endpoints.chatCompletions.enabled true && (openclaw agents list | grep -q 'openflow-immo' || openclaw agents add openflow-immo --workspace /data/workspace/openflow-immo --model openai/gpt-5.6-sol --non-interactive) && openclaw config set 'agents.list[1].models' '{\"openai/gpt-5.6-sol\":{\"agentRuntime\":{\"id\":\"openclaw\"}}}' --strict-json && exec openclaw gateway --bind lan --port ${OPENCLAW_GATEWAY_PORT:-8080}"]
