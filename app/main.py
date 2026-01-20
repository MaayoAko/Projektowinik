from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "candidate": "Szymon",
        "role": "Junior DevOps Engineer",
        "cloud": "Azure",
        "deployed_via": "GitHub Actions + Terraform"
    }

if __name__ == "__main__":
    import uvicorn
    # Pobieramy port z Azure (domyślnie 8000)
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)