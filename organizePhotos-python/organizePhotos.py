import os
import exifread
from datetime import datetime
import shutil

def getPhotoTakenDate(photoPath):
    with open(photoPath, 'rb') as file:
        tags = exifread.process_file(file, details=False)
        dateTag = 'EXIF DateTimeOriginal'
        if dateTag in tags:
            dateTaken = tags[dateTag]
            return datetime.strptime(str(dateTaken), '%Y:%m:%d %H:%M:%S')
    return None

def organizePhotos(sourceFolder, targetFolder):
    if not os.path.exists(targetFolder):
        os.makedirs(targetFolder)

    files = [f for f in os.listdir(sourceFolder) if os.path.isfile(os.path.join(sourceFolder, f))]

    for file in files:
        filePath = os.path.join(sourceFolder, file)

        if file.lower().endswith(('.jpg', '.jpeg', '.png', '.gif')):
            dateTaken = getPhotoTakenDate(filePath)

            if dateTaken:
                subfolder = os.path.join(targetFolder, dateTaken.strftime('%Y/%m'))
                os.makedirs(subfolder, exist_ok=True)

                newFilename = dateTaken.strftime('%Y%m%d_%H%M%S') + os.path.splitext(file)[1]

                newPath = os.path.join(subfolder, newFilename)
                shutil.move(filePath, newPath)

                print(f'Moved {file} to {newPath}')

if __name__ == "__main__":
    sourceFolder = "/pathToSourcePhotos"
    targetFolder = "/pathToOrganizedPhotos"

    organizePhotos(sourceFolder, targetFolder)


# python3 organizePhotos.py