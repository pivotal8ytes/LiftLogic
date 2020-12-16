$inProcessPath = "C:\IT\Raw GoPro Vids"

$oldVideos = Get-ChildItem -Include @("*.mp4", "*.avi", "*.divx", "*.mov", "*.mpg", "*.wmv", "*.mkv", "*.m4v") -Path $inProcessPath -Recurse;

Set-Location -Path "C:\IT\Rotated";

foreach ($oldVideo in $oldVideos) {

    # Set Variable theName

       $theName = $oldVideo.Name;

    # Display the variable

       $theName;

    # Set Arguments
   
       $RotateArgsList = -join ('-i "{0}" -map_metadata 0 -metadata:s:v rotate="270" -codec copy', " ", $theName) -f $oldVideo, $newVideo;

    # Show the argument lists

       $RotateArgsList;

    # Kick off ffmpeg to rotate
    
       Start-Process -FilePath c:\IT\ffmpeg\bin\ffmpeg.exe -ArgumentList $RotateArgsList -Wait;
}

Set-Location -Path 'C:\IT';

# Run the Auto Crop Script

    C:\IT\auto_crop_vids.ps1

# Wait for 5 minutes, then delete the raw files from the computer.

 #  Start-Sleep -s 300;

    foreach ($oldVideo in $oldVideos) {
       Remove-ItemSafely $oldVideo.FullName;
    }

