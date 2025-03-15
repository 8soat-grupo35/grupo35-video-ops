# grupo35-video-ops
Repositório para armazenar a configuração do Terraform necessária para o projeto de vídeo


## Recursos Criados

- Backend Terraform S3 (Bucket: grupo35-terraform-state)

- SNS Topic (Topic: video-status-topic)
    - SNS Subscriber (SQS: video-status-api-queue)
    - SNS Subscriber (SQS: video-status-notification-queue)

- SQS Queue (Queue: video-status-api-queue)
- SQS Queue (Queue: video-status-notification-queue)
- SQS Queue (Queue: video-process-queue)

- S3 Bucket (Bucket: video_processed)