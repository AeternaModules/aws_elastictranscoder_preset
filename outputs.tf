output "elastictranscoder_presets_id" {
  description = "Map of id values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "elastictranscoder_presets_arn" {
  description = "Map of arn values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "elastictranscoder_presets_audio" {
  description = "Map of audio values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => one(v.audio) if v.audio != null && length(v.audio) > 0 }
}
output "elastictranscoder_presets_audio_codec_options" {
  description = "Map of audio_codec_options values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => one(v.audio_codec_options) if v.audio_codec_options != null && length(v.audio_codec_options) > 0 }
}
output "elastictranscoder_presets_container" {
  description = "Map of container values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.container if v.container != null && length(v.container) > 0 }
}
output "elastictranscoder_presets_description" {
  description = "Map of description values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.description if v.description != null && length(v.description) > 0 }
}
output "elastictranscoder_presets_name" {
  description = "Map of name values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "elastictranscoder_presets_region" {
  description = "Map of region values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.region if v.region != null && length(v.region) > 0 }
}
output "elastictranscoder_presets_thumbnails" {
  description = "Map of thumbnails values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => one(v.thumbnails) if v.thumbnails != null && length(v.thumbnails) > 0 }
}
output "elastictranscoder_presets_type" {
  description = "Map of type values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.type if v.type != null && length(v.type) > 0 }
}
output "elastictranscoder_presets_video" {
  description = "Map of video values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => one(v.video) if v.video != null && length(v.video) > 0 }
}
output "elastictranscoder_presets_video_codec_options" {
  description = "Map of video_codec_options values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.video_codec_options if v.video_codec_options != null && length(v.video_codec_options) > 0 }
}
output "elastictranscoder_presets_video_watermarks" {
  description = "Map of video_watermarks values across all elastictranscoder_presets, keyed the same as var.elastictranscoder_presets"
  value       = { for k, v in aws_elastictranscoder_preset.elastictranscoder_presets : k => v.video_watermarks if v.video_watermarks != null && length(v.video_watermarks) > 0 }
}

