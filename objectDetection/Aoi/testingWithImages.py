from ultralytics import YOLO
import cv2
print("Starting")

model = YOLO('../yolov8Weights/yolov8l.pt')
# for images:
# results = model('images/5.jpg', show=True)

cv2.waitKey(0)