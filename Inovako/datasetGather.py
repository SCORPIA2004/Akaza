import fiftyone as fo
import fiftyone.zoo as foz

dataset = foz.load_zoo_dataset(
              "open-images-v7",
              split="validation",
              label_types=["detections", "segmentations", "points"],
              classes=["Piano"],
              max_samples=50,
          )