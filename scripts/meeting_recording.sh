DEFAULT_SINK=$(pactl info | grep "Default Sink" | awk '{print $3}')
DESKTOP_MONITOR="${DEFAULT_SINK}.monitor"

ffmpeg \
  -f pulse -i default \
  -f pulse -i "${DESKTOP_MONITOR}" \
  -filter_complex "amix=inputs=2:normalize=1" \
  -acodec libmp3lame -b:a 192k \
  "meeting_recording_$(date +"%d_%m_%Y_%H-%M").mp3"
