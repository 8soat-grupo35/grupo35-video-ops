resource "aws_sqs_queue" "video-process-queue" {
    name = "video-process-queue"
    delay_seconds = 10
    visibility_timeout_seconds = 10
    max_message_size = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10
    sqs_managed_sse_enabled = true
}


resource "aws_sqs_queue" "video-status-api-queue" {
    name = "video-status-api-queue"
    delay_seconds = 10
    visibility_timeout_seconds = 10
    max_message_size = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10
    sqs_managed_sse_enabled = true
}


resource "aws_sqs_queue_policy" "sh_sqs_policy_video_status_api" {
  queue_url = aws_sqs_queue.video-status-api-queue.id
  policy    = data.aws_iam_policy_document.sh_sqs_policy_video_status_api.json
}

resource "aws_sqs_queue" "video-status-notification-queue" {
    name = "video-status-notification-queue"
    delay_seconds = 10
    visibility_timeout_seconds = 10
    max_message_size = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10
    sqs_managed_sse_enabled = true
}


resource "aws_sqs_queue_policy" "sh_sqs_policy_video_status_notification" {
  queue_url = aws_sqs_queue.video-status-notification-queue.id
  policy    = data.aws_iam_policy_document.sh_sqs_policy_video_status_notification.json
}