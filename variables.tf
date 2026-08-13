variable "elastictranscoder_presets" {
  description = <<EOT
Map of elastictranscoder_presets, attributes below
Required:
    - container
Optional:
    - description
    - name
    - region
    - type
    - video_codec_options
    - audio (block):
        - audio_packing_mode (optional)
        - bit_rate (optional)
        - channels (optional)
        - codec (optional)
        - sample_rate (optional)
    - audio_codec_options (block):
        - bit_depth (optional)
        - bit_order (optional)
        - profile (optional)
        - signed (optional)
    - thumbnails (block):
        - aspect_ratio (optional)
        - format (optional)
        - interval (optional)
        - max_height (optional)
        - max_width (optional)
        - padding_policy (optional)
        - resolution (optional)
        - sizing_policy (optional)
    - video (block):
        - aspect_ratio (optional)
        - bit_rate (optional)
        - codec (optional)
        - display_aspect_ratio (optional)
        - fixed_gop (optional)
        - frame_rate (optional)
        - keyframes_max_dist (optional)
        - max_frame_rate (optional)
        - max_height (optional)
        - max_width (optional)
        - padding_policy (optional)
        - resolution (optional)
        - sizing_policy (optional)
    - video_watermarks (block):
        - horizontal_align (optional)
        - horizontal_offset (optional)
        - id (optional)
        - max_height (optional)
        - max_width (optional)
        - opacity (optional)
        - sizing_policy (optional)
        - target (optional)
        - vertical_align (optional)
        - vertical_offset (optional)
EOT

  type = map(object({
    container           = string
    description         = optional(string)
    name                = optional(string)
    region              = optional(string)
    type                = optional(string)
    video_codec_options = optional(map(string))
    audio = optional(object({
      audio_packing_mode = optional(string)
      bit_rate           = optional(string)
      channels           = optional(string)
      codec              = optional(string)
      sample_rate        = optional(string)
    }))
    audio_codec_options = optional(object({
      bit_depth = optional(string)
      bit_order = optional(string)
      profile   = optional(string)
      signed    = optional(string)
    }))
    thumbnails = optional(object({
      aspect_ratio   = optional(string)
      format         = optional(string)
      interval       = optional(string)
      max_height     = optional(string)
      max_width      = optional(string)
      padding_policy = optional(string)
      resolution     = optional(string)
      sizing_policy  = optional(string)
    }))
    video = optional(object({
      aspect_ratio         = optional(string)
      bit_rate             = optional(string)
      codec                = optional(string)
      display_aspect_ratio = optional(string)
      fixed_gop            = optional(string)
      frame_rate           = optional(string)
      keyframes_max_dist   = optional(string)
      max_frame_rate       = optional(string)
      max_height           = optional(string)
      max_width            = optional(string)
      padding_policy       = optional(string)
      resolution           = optional(string)
      sizing_policy        = optional(string)
    }))
    video_watermarks = optional(list(object({
      horizontal_align  = optional(string)
      horizontal_offset = optional(string)
      id                = optional(string)
      max_height        = optional(string)
      max_width         = optional(string)
      opacity           = optional(string)
      sizing_policy     = optional(string)
      target            = optional(string)
      vertical_align    = optional(string)
      vertical_offset   = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.audio == null || (v.audio.audio_packing_mode == null || (contains(["SingleTrack", "OneChannelPerTrack", "OneChannelPerTrackWithMosTo8Tracks"], v.audio.audio_packing_mode)))
      )
    ])
    error_message = "must be one of: SingleTrack, OneChannelPerTrack, OneChannelPerTrackWithMosTo8Tracks"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.audio == null || (v.audio.channels == null || (contains(["auto", "0", "1", "2"], v.audio.channels)))
      )
    ])
    error_message = "must be one of: auto, 0, 1, 2"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.audio == null || (v.audio.codec == null || (contains(["AAC", "flac", "mp2", "mp3", "pcm", "vorbis"], v.audio.codec)))
      )
    ])
    error_message = "must be one of: AAC, flac, mp2, mp3, pcm, vorbis"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.audio == null || (v.audio.sample_rate == null || (contains(["auto", "22050", "32000", "44100", "48000", "96000"], v.audio.sample_rate)))
      )
    ])
    error_message = "must be one of: auto, 22050, 32000, 44100, 48000, 96000"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.audio_codec_options == null || (v.audio_codec_options.bit_depth == null || (contains(["8", "16", "24", "32"], v.audio_codec_options.bit_depth)))
      )
    ])
    error_message = "must be one of: 8, 16, 24, 32"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.audio_codec_options == null || (v.audio_codec_options.bit_order == null || (contains(["LittleEndian"], v.audio_codec_options.bit_order)))
      )
    ])
    error_message = "must be one of: LittleEndian"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.audio_codec_options == null || (v.audio_codec_options.signed == null || (contains(["Signed", "Unsigned"], v.audio_codec_options.signed)))
      )
    ])
    error_message = "must be one of: Signed, Unsigned"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        contains(["flac", "flv", "fmp4", "gif", "mp2", "mp3", "mp4", "mpg", "mxf", "oga", "ogg", "ts", "wav", "webm"], v.container)
      )
    ])
    error_message = "must be one of: flac, flv, fmp4, gif, mp2, mp3, mp4, mpg, mxf, oga, ogg, ts, wav, webm"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.thumbnails == null || (v.thumbnails.aspect_ratio == null || (contains(["auto", "1:1", "4:3", "3:2", "16:9"], v.thumbnails.aspect_ratio)))
      )
    ])
    error_message = "must be one of: auto, 1:1, 4:3, 3:2, 16:9"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.thumbnails == null || (v.thumbnails.padding_policy == null || (contains(["Pad", "NoPad"], v.thumbnails.padding_policy)))
      )
    ])
    error_message = "must be one of: Pad, NoPad"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.thumbnails == null || (v.thumbnails.sizing_policy == null || (contains(["Fit", "Fill", "Stretch", "Keep", "ShrinkToFit", "ShrinkToFill"], v.thumbnails.sizing_policy)))
      )
    ])
    error_message = "must be one of: Fit, Fill, Stretch, Keep, ShrinkToFit, ShrinkToFill"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video == null || (v.video.aspect_ratio == null || (contains(["auto", "1:1", "4:3", "3:2", "16:9"], v.video.aspect_ratio)))
      )
    ])
    error_message = "must be one of: auto, 1:1, 4:3, 3:2, 16:9"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video == null || (v.video.codec == null || (contains(["gif", "H.264", "mpeg2", "vp8", "vp9"], v.video.codec)))
      )
    ])
    error_message = "must be one of: gif, H.264, mpeg2, vp8, vp9"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video == null || (v.video.display_aspect_ratio == null || (contains(["auto", "1:1", "4:3", "3:2", "16:9"], v.video.display_aspect_ratio)))
      )
    ])
    error_message = "must be one of: auto, 1:1, 4:3, 3:2, 16:9"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video == null || (v.video.fixed_gop == null || (contains(["true", "false"], v.video.fixed_gop)))
      )
    ])
    error_message = "must be one of: true, false"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video == null || (v.video.frame_rate == null || (contains(["auto", "10", "15", "23.97", "24", "25", "29.97", "30", "50", "60"], v.video.frame_rate)))
      )
    ])
    error_message = "must be one of: auto, 10, 15, 23.97, 24, 25, 29.97, 30, 50, 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video == null || (v.video.max_frame_rate == null || (contains(["10", "15", "23.97", "24", "25", "29.97", "30", "50", "60"], v.video.max_frame_rate)))
      )
    ])
    error_message = "must be one of: 10, 15, 23.97, 24, 25, 29.97, 30, 50, 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video == null || (v.video.padding_policy == null || (contains(["Pad", "NoPad"], v.video.padding_policy)))
      )
    ])
    error_message = "must be one of: Pad, NoPad"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video == null || (v.video.sizing_policy == null || (contains(["Fit", "Fill", "Stretch", "Keep", "ShrinkToFit", "ShrinkToFill"], v.video.sizing_policy)))
      )
    ])
    error_message = "must be one of: Fit, Fill, Stretch, Keep, ShrinkToFit, ShrinkToFill"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video_watermarks == null || alltrue([for item in v.video_watermarks : (item.horizontal_align == null || (contains(["Left", "Right", "Center"], item.horizontal_align)))])
      )
    ])
    error_message = "must be one of: Left, Right, Center"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video_watermarks == null || alltrue([for item in v.video_watermarks : (item.sizing_policy == null || (contains(["Fit", "Stretch", "ShrinkToFit"], item.sizing_policy)))])
      )
    ])
    error_message = "must be one of: Fit, Stretch, ShrinkToFit"
  }
  validation {
    condition = alltrue([
      for k, v in var.elastictranscoder_presets : (
        v.video_watermarks == null || alltrue([for item in v.video_watermarks : (item.vertical_align == null || (contains(["Top", "Bottom", "Center"], item.vertical_align)))])
      )
    ])
    error_message = "must be one of: Top, Bottom, Center"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

