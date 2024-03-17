from fastapi import APIRouter

from app.api import crud  # dont import from sqlalchemy!
from app.api.models import NoteSchema, NoteDB

router = APIRouter()


@router.post("/", response_model=NoteDB, status_code=201)
async def create_note(payload: NoteSchema):
    note_id = await crud.post(payload)

    response_object = {
        "id": note_id,
        "title": payload.title,
        "description": payload.description,
    }
    return response_object


@router.get("/get_notes", response_model=list[NoteDB])
async def get_all_notes():
    return await crud.get_notes()
