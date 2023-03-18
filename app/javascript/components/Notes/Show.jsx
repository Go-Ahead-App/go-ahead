import { Inertia } from "@inertiajs/inertia";
import { usePage, Link } from "@inertiajs/inertia-react";

import React, { useState } from "react";

function Edit({ note }) {
  const sharedData = usePage().props;

  const [values, setValues] = useState({
    title: note.title,
    description: note.description,
    content: note.content,
  });

  return (
    <section class="flex my-16 space-x-8">
      <aside class="w-full xl:w-1/4 p-4 md:p-0">
        <Link
          href={`/boards/${note.board_id}/notes/${note.id}/edit`}
          class="block duration-200 hover:text-neutral-400"
        >
          Edit
        </Link>

        <a href="/boards" class="block duration-200 hover:text-neutral-400">
          Back to Boards
        </a>
      </aside>

      <div class="xl:w-2/4">
        <h1 class="font-display xl:text-7xl mb-8">{note.title}</h1>
        <h6 class="text-2xl">{note.description}</h6>

        <div class="text-neutral-300 mt-8 leading-7">{note.content}</div>
      </div>

      <div class="xl:w-1/4">
        <div class="flex items-center space-x-4">
          <i class="ph ph-calendar-light text-3xl"></i>

          <div>
            <h6 class="font-medium text-lg">Reminder</h6>
            <p class="text-sm text-neutral-300">
              You have 3 programs to review
            </p>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Edit;
