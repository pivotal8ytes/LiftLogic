$inProcessPath = "C:\IT\Rotated"

$oldVideos = Get-ChildItem -Include @("*.mp4", "*.avi", "*.divx", "*.mov", "*.mpg", "*.wmv", "*.mkv", "*.m4v") -Path $inProcessPath -Recurse;

Set-Location -Path 'C:\Users\Andy\Google Drive\Processed GoPro Vids';

foreach ($oldVideo in $oldVideos) {

    # Set Variable theName

      $theName = $oldVideo.Name;

    # Display the variable

      $theName;

    # Set Arguments
   
      $CropArgumentList = -join ('-i "{0}" -vf "crop=in_w:in_h-500:0:500" -c:a copy', " ", $theName) -f $oldVideo, $newVideo;

    # Show the argument lists

      $CropArgumentList;

    # Kick off ffmpeg to crop and re-encode (but not reencode audio)
    
      Start-Process -FilePath c:\IT\ffmpeg\bin\ffmpeg.exe -ArgumentList $CropArgumentList -Wait;
}

Set-Location -Path 'C:\IT';

# Wait for 7200 seconds (120 minutes), then delete the files from the computer. This long because cropping takes a long time. Keep file in recycle bin for 5 days (windows tool)

#    Start-Sleep -s 7200;

    foreach ($oldVideo in $oldVideos) {
       Remove-ItemSafely $oldVideo.FullName;
    }

