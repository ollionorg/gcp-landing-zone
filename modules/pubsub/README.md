
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_service.enable_destination_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_pubsub_subscription.pubsub_push_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_subscription.pubsub_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_topic.topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |
| [google_pubsub_topic_iam_member.pubsub_sink_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam_member) | resource |
| [google_pubsub_topic_iam_member.pubsub_subscriber_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam_member) | resource |
| [google_pubsub_topic_iam_member.pubsub_viewer_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam_member) | resource |
| [google_service_account.pubsub_subscriber](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_push_subscriber"></a> [create\_push\_subscriber](#input\_create\_push\_subscriber) | Whether to add a push configuration to the subcription. If 'true', a push subscription is created along with a service account that is granted roles/pubsub.subscriber and roles/pubsub.viewer to the topic. | `bool` | `false` | no |
| <a name="input_create_subscriber"></a> [create\_subscriber](#input\_create\_subscriber) | Whether to create a subscription to the topic that was created and used for log entries matching the filter. If 'true', a pull subscription is created along with a service account that is granted roles/pubsub.subscriber and roles/pubsub.viewer to the topic. | `bool` | `false` | no |
| <a name="input_log_sink_writer_identity"></a> [log\_sink\_writer\_identity](#input\_log\_sink\_writer\_identity) | The service account that logging uses to write log entries to the destination. (This is available as an output coming from the root module). | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the pubsub topic will be created. | `string` | n/a | yes |
| <a name="input_push_endpoint"></a> [push\_endpoint](#input\_push\_endpoint) | The URL locating the endpoint to which messages should be pushed. | `string` | `""` | no |
| <a name="input_subscription_labels"></a> [subscription\_labels](#input\_subscription\_labels) | A set of key/value label pairs to assign to the pubsub subscription. | `map(string)` | `{}` | no |
| <a name="input_topic_labels"></a> [topic\_labels](#input\_topic\_labels) | A set of key/value label pairs to assign to the pubsub topic. | `map(string)` | `{}` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | The name of the pubsub topic to be created and used for log entries matching the filter. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_console_link"></a> [console\_link](#output\_console\_link) | The console link to the destination storage bucket |
| <a name="output_destination_uri"></a> [destination\_uri](#output\_destination\_uri) | The destination URI for the topic. |
| <a name="output_project"></a> [project](#output\_project) | The project in which the topic was created. |
| <a name="output_pubsub_push_subscription"></a> [pubsub\_push\_subscription](#output\_pubsub\_push\_subscription) | Pub/Sub push subscription id (if any) |
| <a name="output_pubsub_subscriber"></a> [pubsub\_subscriber](#output\_pubsub\_subscriber) | Pub/Sub subscriber email (if any) |
| <a name="output_pubsub_subscription"></a> [pubsub\_subscription](#output\_pubsub\_subscription) | Pub/Sub subscription id (if any) |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The resource id for the destination topic |
| <a name="output_resource_name"></a> [resource\_name](#output\_resource\_name) | The resource name for the destination topic |
