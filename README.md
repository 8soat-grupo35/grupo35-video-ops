# Grupo 35 Vídeo Ops

Repositório para armazenar a configuração do Terraform necessária para o projeto de vídeo do grupo 35


## Recursos Criados

#### Bucket S3

| Nome do Recurso  | Descrição                           |
| :---------- | :---------------------------------- |
| `grupo35-terraform-state` | Salva o arquivo de estado do terraform em backend |
| `video_processed` | Bucket que irá salvar os arquivos .zip processados com as imagens dos vídeos |

#### SQS

| Nome do Recurso  | Descrição                           |
| :---------- | :---------------------------------- |
| `video-process-queue` | Fila para envio dos vídeos que devem ser processados pelo worker |
| `video-status-api-queue` | Fila para atualização dos status de processamento do worker |
| `video-status-notification-queue` | Fila para atualização dos status de processamento do worker |

#### SNS

| Nome do Recurso  | Descrição                           |
| :---------- | :---------------------------------- |
| `video-status-topic` | Tópico para informar as atualizações de status do processamento de vídeo |


#### SNS Subscribers

| Nome do Recurso Inscrito  | Recurso à ser inscrito |
| :---------- | :---------------------------------- |
| `video-status-topic` | `video-status-api-queue` |
| `video-status-topic` | `video-status-notification-queue` |
