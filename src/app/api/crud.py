from app.api.models import NoteSchema, NoteDB
from app.db import notes, database


async def post(payload: NoteSchema):
    query = notes.insert().values(title=payload.title, description=payload.description)

    return await database.execute(query=query)


async def get_notes():
    query = notes.select()

    return await database.fetch_all(query=query)
