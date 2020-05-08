{{- if and .Values.persistence.enabled (not .Values.persistence.existingClaim) -}}
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
{{- if .Values.persistence.annotations }}
  annotations:
{{ toYaml .Values.persistence.annotations | indent 4 }}
{{- end }}
  name: {{ template "ledger.fullname" . }}
  labels:
    "app.kubernetes.io/name": '{{ template "ledger.name" .}}'
    "helm.sh/chart": "{{ .Chart.Name }}-{{ .Chart.Version }}"
    "app.kubernetes.io/managed-by": "{{ .Release.Service }}"
    "app.kubernetes.io/instance": "{{ .Release.Name }}"
spec:
  accessModes:
    - {{ .Values.persistence.accessMode | quote }}
  resources:
    requests:
      storage: {{ .Values.persistence.size | quote }}
{{- if .Values.persistence.storageClass }}
{{- if (eq "-" .Values.persistence.storageClass) }}
  storageClassName: ""
{{- else }}
  storageClassName: "{{ .Values.persistence.storageClass }}"
{{- end }}
{{- end }}
{{- end }}