global:
  resolve_timeout: 5m

route:
  receiver: 'slack'
  group_by: ['alertname']
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 3h

receivers:
  - name: 'slack'
    slack_configs:
      - channel: "SLACK_CHANNEL"
        api_url: "SLACK_WEBHOOK"
        send_resolved: true
        title: "🔥 Alert: {{ .CommonLabels.alertname }}"
        text: |
          *Machine*: {{ .PUBLIC_IP }}
          *Summary*: {{ .CommonAnnotations.summary }}
          *Description*: {{ .CommonAnnotations.description }}
