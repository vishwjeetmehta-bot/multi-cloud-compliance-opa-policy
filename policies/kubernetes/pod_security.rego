package kubernetes.security

# Disallow privileged containers in Kubernetes
deny[msg] {
    input.kind == "Pod"
    container := input.spec.containers[_]
    container.securityContext.privileged == true

    msg := sprintf("Container '%v' in Pod '%v' must not run in privileged mode.", [container.name, input.metadata.name])
}

# Enforce resource memory and CPU limits
deny[msg] {
    input.kind == "Pod"
    container := input.spec.containers[_]
    not container.resources.limits.memory

    msg := sprintf("Container '%v' in Pod '%v' does not define a memory limit.", [container.name, input.metadata.name])
}
