from PIL import Image
im = Image.open("graph_data_og.png").crop((0, 145, 2100, 1405))
im.save("graph_data.png")