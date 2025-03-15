data "aws_vpc" "vpc" {
  cidr_block = var.vpcCidr
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "availability-zone"
    values = ["${var.regionDefault}a","${var.regionDefault}b"]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}

data "aws_iam_role" "labrole" {
  name = "LabRole"
}

data "aws_iam_policy_document" "sh_sqs_policy_video_status_api" {
  statement {
    sid    = "shsqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.video-status-api-queue.arn
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_sns_topic.video-status-topic.arn] # Substitua 'seu_topico_sns' pelo nome do seu recurso SNS
    }
  }
}

data "aws_iam_policy_document" "sh_sqs_policy_video_status_notification" {
  statement {
    sid    = "shsqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.video-status-notification-queue.arn
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_sns_topic.video-status-topic.arn] # Substitua 'seu_topico_sns' pelo nome do seu recurso SNS
    }
  }
}