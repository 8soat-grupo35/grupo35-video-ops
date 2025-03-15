resource "aws_sns_topic" "video-status-topic" {
    name = "video-status-topic"
}

resource "aws_sns_topic_subscription" "video-status-api-topic-subscription" {
    topic_arn = aws_sns_topic.video-status-topic.arn
    protocol = "sqs"
    endpoint = aws_sqs_queue.video-status-api-queue.arn
    raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "video-status-notification-topic-subscription" {
    topic_arn = aws_sns_topic.video-status-topic.arn
    protocol = "sqs"
    endpoint = aws_sqs_queue.video-status-notification-queue.arn
    raw_message_delivery = true
}