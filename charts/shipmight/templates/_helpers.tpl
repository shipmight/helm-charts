{{/*
General
*/}}

{{- define "shipmight.image" -}}
{{ printf "%s/%s:%s" .Values.image.registry .Values.image.repository .Values.image.tag | quote }}
{{- end -}}

{{/*
Labels
*/}}

{{- define "shipmight.commonLabels" -}}
app.kubernetes.io/name: shipmight
{{- end -}}

{{- define "shipmight.apiSelectorLabels" -}}
shipmight/component: api
{{- end -}}

{{- define "shipmight.uiSelectorLabels" -}}
shipmight/component: ui
{{- end -}}

{{/*
Env
*/}}


# Env used in all containers
{{- define "shipmight.commonEnv" }}
- name: NODE_ENV
  value: production
- name: LOG
  value: "shipmight:"
{{ end -}}

# Env used in api and installer
{{- define "shipmight.configEnv" }}
- name: RELEASE_NAMESPACE
  value: {{ .Release.Namespace | quote }}
- name: RELEASE_NAME
  value: {{ .Release.Name | quote }}
- name: SELF_UPDATE_REPOSITORY
  value: {{ .Values.config.selfUpdateRepository | quote }}
- name: READABLE_UUIDS
  value: {{ ternary "true" "false" .Values.config.readableUuids | quote }}
- name: UUID_LENGTH
  value: {{ .Values.config.uuidLength | quote }}
- name: LOKI_ENDPOINT
  value: {{ .Values.config.lokiEndpoint | quote }}
- name: JWT_SECRET
  valueFrom:
    secretKeyRef:
      name: shipmight-secrets
      key: JWT_SECRET
- name: INITIAL_ADMIN_USER
  valueFrom:
    secretKeyRef:
      name: shipmight-secrets
      key: INITIAL_ADMIN_USER
- name: INITIAL_ADMIN_PASS
  valueFrom:
    secretKeyRef:
      name: shipmight-secrets
      key: INITIAL_ADMIN_PASS
{{ end -}}

# Env used in ui
{{- define "shipmight.uiEnv" }}
- name: UI_API_PROXY_ENDPOINT
  value: http://shipmight-api:3001
- name: UI_INGRESS_PATH
  value: {{ .Values.ui.ingress.path | quote }}
{{ end -}}
