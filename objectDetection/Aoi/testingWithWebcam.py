import cvzone
from ultralytics import YOLO
import cv2
print("Starting")

cap = cv2.VideoCapture(0, cv2.CAP_DSHOW)
cap.set(3,640)
cap.set(4, 480)

model = YOLO('../yolov8Weights/yolov8n.pt')


while(True):
    success, img = cap.read()
    results = model(img, stream=True)
    for r in results:
        boxes = r.boxes
        for box in boxes:
            x1,y1,x2,y2 = box.xyxy[0]
            x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
            cv2.rectangle(img, (x1, y1), (x2, y2), (0,255,0), 3)
            cvzone.cornerRect(img, bbox=)

    cv2.imshow("Image", img)
    cv2.waitKey(1)