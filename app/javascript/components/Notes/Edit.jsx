import { Inertia } from "@inertiajs/inertia";
import { usePage, Link } from "@inertiajs/inertia-react";

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

  React.useEffect(() => {
    const content = document.getElementById("content");
    content.style.height = content.scrollHeight + "px";
  }, []);

  function handleChange(e) {
    const key = e.target.id;
    const value = e.target.value;

    if (key === "content") {
      e.target.style.height = e.target.scrollHeight + "px";
    }

    setValues((values) => ({
      ...values,
      [key]: value,
    }));
  }

  function handleSubmit(e) {
    e.preventDefault();

    Inertia.put(`/boards/${note.board_id}/notes/${note.id}`, values);
  }

  return (
    <section>
      <form className="lg:w-1/2 mx-auto md:mt-32" onSubmit={handleSubmit}>
        <Link
          href={`/boards/${note.board_id}/notes/${note.id}`}
          class="block duration-200 hover:text-neutral-400"
        >
          Back
        </Link>

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
          className="text-2xl bg-transparent border-0 w-full mt-8 focus:outline-none focus:ring-0"
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
