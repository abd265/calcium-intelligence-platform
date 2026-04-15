from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

app = FastAPI(title="Calcium Intelligence API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"status": "Calcium Platform Online"}

@app.post("/upload")
async def upload_video(video: UploadFile = File(...), mask: UploadFile = File(...)):
    return {"job_id": "job_123", "n_frames": 1000, "dims": [512, 512]}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
