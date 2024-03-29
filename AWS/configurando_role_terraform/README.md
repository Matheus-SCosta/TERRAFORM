Configurando role na aws para terraform, ao invés do uso de access_key e secret_key para CI/CD.



Para conseguirmos utilizar os comandos do terraform para planejar ações, aplicar e destruir na AWS, geralmente criamos um usuário para o terraform e utilizamos o seu access_key e secret_access_key. Porém isso em CI/CD pode não ser uma boa prática, pois existe a necessidade de expor de qualquer forma que seja o access_key e a secret_access_key do usuário criado. Há uma outra forma de realizar esse procedimento sem precisar ter em sua conta AWS nenhum usuário para o terraform, e sem precisar expor de qualquer forma que seja o access_key e a secret_access_key desse usuário.

A Alternativa seria ao invés de utilizar um usuário, utilizar uma role. Uma função/role AWS serve em geral para permitir que algum recursos AWS tenha acesso a algum outro recurso AWS. Por exemplo, podemos criar uma role que seja para EC2, cujo essa role permite que a EC2 tenha acesso a algum determinado bucket S3 na AWS.

Mas antes de criarmos a Role, podemos criar uma politica, pois iremos attachar a mesma na Role que iremos criar. A idéia de criar a politica seria limitar os recursos que o terraform poderar criar e destruir, mas caso queira liberar o acessar Administrator para a Role, não é necessário criar nenhuma politica, por tanto essa parte se torna opcional. Abaixo segue uma alternativa de regras para a politica no formato json:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "lambda:*",
                "apigateway:*",
                "ec2:*",
                "rds:*",
                "s3:*",
                "sns:*",
                "states:*",
                "ssm:*",
                "sqs:*",
                "iam:*",
                "elasticloadbalancing:*",
                "autoscaling:*",
                "cloudwatch:*",
                "cloudfront:*",
                "route53:*",
                "ecr:*",
                "logs:*",
                "ecs:*",
                "application-autoscaling:*",
                "logs:*",
                "events:*",
                "elasticache:*",
                "es:*",
                "kms:*",
                "dynamodb:*",
                "eks:*",
                "arm:*"
            ],
            "Resource": "*",
            "Effect": "Allow",
            "Sid": "AllowSpecifics"
        },
        {
            "Action": [
                "iam:*User*",
                "iam:*Login*",
                "iam:*Group*",
                "iam:*Provider*",
                "aws-portal:*",
                "budgets:*",
                "config:*",
                "directconnect:*",
                "aws-marketplace:*",
                "aws-marketplace-management:*",
                "ec2:*ReservedInstances*"
            ],
            "Resource": "*",
            "Effect": "Deny",
            "Sid": "DenySpecifics"
        }
    ]
}

```  

Pronto, já temos a nossa politica criada, mas para seguirmos vamos supor uma seguinte situação que temos em nosso ambiente: Temos 2 contas AWS, em uma delas (CONTA A) roda o seu serviço de CI onde no nosso exemplo será o GITLAB, onde possuimos um projeto terraform com uma pipeline gitlab-ci.yml e a outra conta (CONTA B) será uma conta nova, onde vamos subir os nossos serviços em IAC.

Precisaremos então criar na nova conta (CONTA B) uma role para o terraform conseguir acesso a essa conta.

Então para a criação dessa role, podemos fazer de diversas formas. Podemos criar ela de forma manual ou por exemplo através do cloudformation. Para criamos a role de forma manual, podemos seguir o seguintes passos na nova conta (CONTA B):

* Acessar o console da AWS
* Ir no serviço de IAM
* Selecionar a opção ROLE e em seguida CREATE ROLE
* Crie uma role do tipo "Another AWS account" e no campo Account ID coloque o ID da conta que está o GITLAB (CONTA A).
* Selecione uma politica e introduza TAGS se desejar
* Atribua um nome para a role e clique em "CREATE ROLE"


Pronto, dessa forma já temos criado a nossa Role com as politicas que desejamos e já podemos utiliza-la. Agora para utilizarmos essa role em nosso projeto do terraform precisamos fazer algumas configurações.

Precisaremos configurar em nosso bloco "provider". Caso se tivermos um backend podemos utilizar a seguinte configuração:

```
terraform {
  required_version = "1.1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
  backend "s3" {
    bucket = "tfstate-backend-234234234234234454"
    key    = "tfstate-backend.tfstate"
    region = "us-east-2"
    role_arn = "arn:aws:iam::39896380392933:role/Terraform"
    dynamodb_table = "terraform-locked"
    encrypt = true
  }
}

provider "aws" {
  region  = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::39896380392933:role/Terraform"
    session_name = "terraform_cross_account_access_role"
  }
}
```


