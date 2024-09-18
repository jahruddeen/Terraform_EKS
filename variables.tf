variable "vpc_id" {
    description = "Vpc CIDR"
    type = string 
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_subnet" "aws_subnet-1" {
  vpc_id            = data.aws_vpc.aws_subnet-1.id
  availability_zone = "us-east-2"
  cidr_block        = cidrsubnet(data.aws_vpc.aws_subnet-1.cidr_block, 4, 1)
}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: minimal-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx-example
  rules:
  - http:
      paths:
      - path: /testpath
        pathType: Prefix
        backend:
          service:
            name: test
            port:
              number: 80
