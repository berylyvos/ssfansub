## With Google Colaboratory

### Install

```sh
!pip install git+https://github.com/openai/whisper.git
!sudo apt update && sudo apt install ffmpeg
```
### Run

```sh
!whisper "FILE_NAME" --model medium.en
```