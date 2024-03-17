from fastapi import FastAPI

from app.api import ping, notes
from app.db import database, metadata, engine

metadata.create_all(engine)

app = FastAPI()


async def startup():
    await database.connect()


async def shutdown():
    await database.disconnect()


app.add_event_handler("startup", startup)
app.add_event_handler("shutdown", shutdown)

app.include_router(ping.router)
app.include_router(notes.router, prefix="/notes", tags=["Notes"])
