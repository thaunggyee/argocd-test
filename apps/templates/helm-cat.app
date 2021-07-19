# {{- $targetNamespace := "demo" -}}
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: cat-{{ $targetNamespace }}
spec:
  destination:
    namespace: {{ $targetNamespace }}
    server: "{{ .Values.spec.destination.server }}"
  source:
    path: helm-cat
    repoURL: "{{ .Values.spec.source.repoURL }}"
    targetRevision: "{{ .Values.spec.source.targetRevision }}"
    helm:
      valueFiles:
        - values.yaml
  project: default
  syncPolicy:
    automated:
      prune: false
      selfHeal: true
 
