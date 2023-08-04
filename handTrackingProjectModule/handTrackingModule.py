import cv2
import mediapipe as mp
import time



class handDetector():
    def __init__(self, mode=False, maxHands=4, detectionCon=0.5, trackCon=0.5, modelComplexity=1):
        self.mode = mode # static_image_mode
        self.maxHands = maxHands # max_num_hands
        self.detectionCon = detectionCon # min_detection_confidence
        self.trackCon = trackCon # min_tracking_confidence
        self.modelComplex = modelComplexity

        self.mpHands = mp.solutions.hands
        self.hands = self.mpHands.Hands(self.mode, self.maxHands, self.modelComplex, self.detectionCon, self.trackCon)
        self.mpDraw = mp.solutions.drawing_utils

    def findHands(self, img, draw=True):
        imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        self.results = self.hands.process(imgRGB)

        if self.results.multi_hand_landmarks:
            for handLms in self.results.multi_hand_landmarks:
                if draw:
                    self.mpDraw.draw_landmarks(img, handLms, self.mpHands.HAND_CONNECTIONS)

        return img

    def findPosition(self, img, handNo=0, draw=True, onlyFingerTips=False):
        lmList = []

        if self.results.multi_hand_landmarks:
            curHand = self.results.multi_hand_landmarks[handNo]

            # print("\nReading:")
            for id, lm in enumerate(curHand.landmark):
                h, w, c = img.shape
                cx, cy = int(lm.x * w), int(lm.y * h)

                finger = self.getFinger(id)
                if not onlyFingerTips:
                    lmList.append([id, finger, cx, cy])
                    if draw:
                        cv2.circle(img, (cx, cy), 15, (255, 0, 255), cv2.FILLED)
                else:
                    if id % 4 == 0:
                        lmList.append([id, finger, cx, cy])
                        if draw:
                            cv2.circle(img, (cx, cy), 15, (255, 0, 255), cv2.FILLED)
        return lmList

    def getFinger(self, id, colon=False):
        if colon:
            if id == 0: return "Wrist:  "
            if id == 4: return "Thumb:  "
            if id == 8: return "Index:  "
            if id == 12: return "Middle: "
            if id == 16: return "Ring:   "
            if id == 20: return "Pinky:  "
            return "None: "
        else:
            if id == 0: return "Wrist"
            if id == 4: return "Thumb"
            if id == 8: return "Index"
            if id == 12: return "Middle"
            if id == 16: return "Ring"
            if id == 20: return "Pinky"
            return "None"

    def getFingerID(name):
        if name == "Wrist" or name == "wrist": return 0
        if name == "Thumb" or name == "thumb": return 4
        if name == "Index" or name == "index": return 8
        if name == "Middle" or name == "middle": return 12
        if name == "Ring" or name == "ring": return 16
        if name == "Pinky" or name == "pinky": return 20


        return "Error: "


def htm(fingerTips=True, trackFinger="None"):
    pTime = 0
    cTime = 0
    cap = cv2.VideoCapture(0)
    detector = handDetector()
    while True:
        success, img = cap.read()
        img = detector.findHands(img)
        lmList = detector.findPosition(img,0, False)

        if trackFinger != "None":
            id = handDetector.getFingerID(name=trackFinger)
            if len(lmList) != 0:
                print(lmList[id])

        cTime = time.time()
        fps = 1 / (cTime - pTime)
        pTime = cTime

        cv2.putText(img, str(int(fps)), (10, 50), cv2.FONT_HERSHEY_PLAIN, 3, (0, 255, 0), 3)
        cv2.imshow("Webcam input", img)
        cv2.waitKey(1)