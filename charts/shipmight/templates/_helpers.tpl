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

# duplicate env used in api and installer
{{- define "shipmight.apiEnv" }}
- name: RELEASE_NAMESPACE
  value: {{ .Release.Namespace | quote }}
- name: RELEASE_NAME
  value: {{ .Release.name | quote }}
- name: API_READABLE_UUIDS
  value: {{ ternary "true" "false" .Values.api.readableUuids | quote }}
- name: API_UUID_LENGTH
  value: {{ .Values.api.uuidLength | quote }}
- name: DOMAINS_INGRESS_CLASS
  value: {{ .Values.domains.ingressClass | quote }}
- name: LOKI_ENDPOINT
  value: {{ .Values.loki.endpoint | quote }}
- name: AUTH_JWT_SECRET
  valueFrom:
    secretKeyRef:
      name: shipmight-secrets
      key: AUTH_JWT_SECRET
- name: AUTH_INITIAL_ADMIN_USER
  valueFrom:
    secretKeyRef:
      name: shipmight-secrets
      key: AUTH_INITIAL_ADMIN_USER
- name: AUTH_INITIAL_ADMIN_PASS
  valueFrom:
    secretKeyRef:
      name: shipmight-secrets
      key: AUTH_INITIAL_ADMIN_PASS
{{ end -}}
