from ultralytics import YOLO
import cv2
print("Starting")

model = YOLO('yolov8n.pt')
results = model('images/6.jpg', show=True)

cv2.waitKey(0)