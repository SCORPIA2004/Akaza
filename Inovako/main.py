from PIL import Image
from ultralytics import YOLO

# Load a model
model = YOLO("yolov8n.yaml")  # build a new model from scratch
# model = YOLO("best.pt")  # load a pretrained model (recommended for training)

# # Use the model
model.train(data="config.yaml", epochs=3)  # train the model
metrics = model.val()  # evaluate model performance on the validation set
print(metrics)  # print metrics to screen

# predict on image in dataset/test/baja.jpg
results = model.predict("baja.jpg")
# View results
for r in results:
    im_array = r.plot()  # plot a BGR numpy array of predictions
    im = Image.fromarray(im_array[..., ::-1])  # RGB PIL image
    im.show()  # show image
    im.save('results.jpg')  # save image

path = model.export(format="onnx")  # export the model to ONNX format
# show the "Precision", "Recall" and "F1-Score" scores of the results of the model.
