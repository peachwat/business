import re
import os
import requests
import io
from PIL import Image


def sanitize_filename(filename: str) -> str:
    """
    Sanitizes a string to be used as a valid filename.
    Removes or replaces characters that are not allowed in most filesystems.
    """
    if not filename:
        return "_unknown_"
    # Replace slashes and backslashes with underscores
    filename = re.sub(r'[/\\]', '_', filename)
    # Remove characters that are generally not allowed in filenames
    filename = re.sub(r'[^a-zA-Z0-9\._-]', '', filename)
    # Limit length to avoid issues with long filenames
    return filename[:100].lower()


def download_image(image_url: str, base_filename: str, directory: str):
    """
    Downloads an image from a URL, processes it with Pillow, and saves it
    to a specified directory always as JPEG.
    """
    try:
        response = requests.get(image_url, stream=True)
        response.raise_for_status()  # Raise an exception for bad status codes

        image_data = io.BytesIO(response.content)
        img = Image.open(image_data)

        # Always save as JPEG
        final_extension = '.jpg'
        file_format = 'JPEG'
        
        # Convert to RGB if not already (JPEGs don't support alpha)
        if img.mode != 'RGB':
            img = img.convert('RGB')

        full_save_path = os.path.join(directory, f"{base_filename}{final_extension}")

        os.makedirs(directory, exist_ok=True)
        img.save(full_save_path, format=file_format)
        return full_save_path
    except requests.exceptions.RequestException as e:
        print(f"Error downloading {image_url}: {e}")
        return None
    except IOError as e:
        print(f"Error processing or saving image to {full_save_path}: {e}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred with {image_url}: {e}")
        return None