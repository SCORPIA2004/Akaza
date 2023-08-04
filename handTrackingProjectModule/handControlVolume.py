import cv2
import time
import math
import numpy as np
import handTrackingModule as htm
from comtypes import CLSCTX_ALL
from pycaw.pycaw import AudioUtilities, IAudioEndpointVolume

scale = 1.5
cameraWidth, cameraHeight = 640 * scale, 480 * scale

# Pycaw lib code
devices = AudioUtilities.GetSpeakers()
interface = devices.Activate(IAudioEndpointVolume._iid_, CLSCTX_ALL, None)
volume = interface.QueryInterface(IAudioEndpointVolume)
volumeRange = volume.GetVolumeRange()
minVolume = volumeRange[0]
maxVolume = volumeRange[1]
# Pycaw lib code END


# window options
cap = cv2.VideoCapture(0)
cap.set(10, 150)
cap.set(3, cameraWidth)
cap.set(4, cameraHeight)
pTime = 0
volumeLevel = 0
volumeLevelBar = 500
volumePercentage = 0
# initialize hand detector
detector = htm.handDetector(detectionCon=0.9)

while True:
    success, img = cap.read()
    img = detector.findHands(img)
    lmList = detector.findPosition(img, draw=False)

    if len(lmList) != 0:
        # tip of index and thumb fingers
        thumbFingerX = lmList[4][2]
        thumbFingerY = lmList[4][3]
        indexFingerX = lmList[8][2]
        indexFingerY = lmList[8][3]

        # center of line between index and thumb fingers
        centerFingerX = (thumbFingerX + indexFingerX) // 2
        centerFingerY = (thumbFingerY + indexFingerY) // 2

        # calculate the length of the line between index and thumb fingers
        length = math.hypot(indexFingerX - thumbFingerX, indexFingerY - thumbFingerY)
        lengthMax = 250
        lengthMin = 30
        # plot the circles on thumb and index fingertips + line between them + center of line
        if length < lengthMin:
            cv2.circle(img, (centerFingerX, centerFingerY), 15, (0, 255, 0), cv2.FILLED)
        elif length > lengthMax:
            cv2.line(img, (thumbFingerX, thumbFingerY), (indexFingerX, indexFingerY), (0, 0, 255), 3)
        else:
            cv2.circle(img, (thumbFingerX, thumbFingerY), 15, (255, 0, 255), cv2.FILLED)
            cv2.circle(img, (indexFingerX, indexFingerY), 15, (255, 0, 255), cv2.FILLED)
            cv2.line(img, (thumbFingerX, thumbFingerY), (indexFingerX, indexFingerY), (255, 0, 255), 3)
            cv2.circle(img, (centerFingerX, centerFingerY), 15, (255, 0, 255), cv2.FILLED)

        # Hand range 50 - 300
        # Volume range -63.5 - 0
        volumeLevel = np.interp(length, [lengthMin, lengthMax], [minVolume, maxVolume])
        volumeLevelBar = np.interp(length, [lengthMin, lengthMax], [500, 150])
        volumePercentage = np.interp(length, [lengthMin, lengthMax], [0, 100])
        # print(volume)
        volume.SetMasterVolumeLevel(volumeLevel, None)

    cTime = time.time()
    fps = 1 / (cTime - pTime)
    pTime = cTime

    font = cv2.FONT_HERSHEY_SIMPLEX
    fontScale = 2
    color = (0, 0, 0)
    volumeContainerBottomY = 500
    volumeContainerTopY = 150
    volumeContainerLeftX = 50
    volumeContainerRightX = 90

    # draw rectangle border
    cv2.rectangle(img, (volumeContainerLeftX - 3, volumeContainerTopY - 3), (volumeContainerRightX + 3, volumeContainerBottomY + 3), (0, 0, 0), 3)
    # draw volume bar
    cv2.rectangle(img, (volumeContainerLeftX, int(volumeLevelBar)), (volumeContainerRightX, 500), (0, 255 * (1 - (volumePercentage / 100)), 255 * (volumePercentage / 100)), cv2.FILLED)
    # draw volume percentage
    cv2.putText(img, f'{int(volumePercentage)} %', (100, 500), font, fontScale, color, 2)
    # draw fps
    cv2.putText(img, f'FPS: {int(fps)}', (10, 50), font, (fontScale - 1), color, 3)
    cv2.imshow("Volume Controller", img)
    cv2.waitKey(1)
