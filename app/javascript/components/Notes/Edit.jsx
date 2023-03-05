import { Inertia } from "@inertiajs/inertia";
import { usePage } from "@inertiajs/inertia-react";

import React, { useState } from "react";

function Edit({ note }) {
  const sharedData = usePage().props;

  const [values, setValues] = useState({
    board_id: note.board_id,
    user_id: note.user_id,
    authenticity_token: sharedData.csrf_token,
    title: note.title,
    description: note.description,
    content: note.content,
  });

  function handleChange(e) {
    const key = e.target.id;
    const value = e.target.value;

    console.log(key, value);

    setValues((values) => ({
      ...values,
      [key]: value,
    }));

    console.log(key, value);
  }

  function handleSubmit(e) {
    e.preventDefault();

    Inertia.put(`/boards/${note.board_id}/notes/${note.id}`, values);
  }

  return (
    <section>
      <form className="lg:w-1/2 mx-auto md:mt-32" onSubmit={handleSubmit}>
        <input
          type="text"
          id="title"
          value={values.title || note.title}
          onChange={handleChange}
          placeholder="Note title"
          className="font-bold font-display text-7xl bg-transparent border-0 w-full"
        />

        <input
          type="text"
          id="description"
          value={values.description || note.description}
          onChange={handleChange}
          placeholder="Note description"
          className="font-medium text-3xl bg-transparent border-0 w-full mt-4"
        />

        <textarea
          id="content"
          value={values.content || note.content}
          onChange={handleChange}
          placeholder="Note content"
          className="text-2xl bg-transparent border-0 w-full mt-8"
        />

        <button
          type="submit"
          placeholder="Note content"
          onChange={handleChange}
          className="px-6 py-4 text-sm bg-neutral-900 duration-200 hover:bg-neutral-800 mt-8"
        >
          Save Changes
        </button>
      </form>
    </section>
  );
}

export default Edit;
