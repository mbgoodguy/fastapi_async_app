from fastapi import FastAPI

from app.api import ping
from app.db import database, metadata, engine

metadata.create_all(engine)

app = FastAPI()
app.include_router(ping.router)


@app.on_event("startup")
async def startup():
    await database.connect()


@app.on_event("shutdown")
async def shutdown():
    await database.disconnect()
