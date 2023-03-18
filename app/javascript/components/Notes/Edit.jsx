import { Inertia } from "@inertiajs/inertia";
import { usePage, Link } from "@inertiajs/inertia-react";

import React, { useState } from "react";

function Edit({ note, categories }) {
  const sharedData = usePage().props;

  const [values, setValues] = useState({
    board_id: note.board_id,
    user_id: note.user_id,
    authenticity_token: sharedData.csrf_token,
    title: note.title,
    description: note.description,
    content: note.content,
    categories: categories,
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

  function handleCategoryCreation(e) {
    e.preventDefault();

    const categoryField = document.getElementById("category_field");

    if (categoryField.value === "") {
      return;
    }

    const category = {
      name: categoryField.value,
      note_id: note.id,
      user_id: note.user_id,
      authenticity_token: sharedData.csrf_token,
    };

    fetch(`/boards/${note.board_id}/notes/${note.id}/categories`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": sharedData.csrf_token,
      },
      body: JSON.stringify(category),
    })
      .then((response) => response.json())
      .then((data) => {
        const categoriesContainer = document.getElementById(
          "categories_container"
        );

        if (data.error) {
        } else {
          const categoryElement = document.createElement("li");
          categoryElement.className = "flex items-center space-x-4";

          const iconElement = document.createElement("i");
          iconElement.className = "ph ph-tag-light";

          const spanElement = document.createElement("span");
          spanElement.innerText = data.category.name;

          categoryElement.appendChild(iconElement);
          categoryElement.appendChild(spanElement);

          categoriesContainer.appendChild(categoryElement);

          const notice = document.getElementById("notice");

          notice.innerText = "Category created successfully";
        }
      });

    categoryField.value = "";
  }

  return (
    <section className="mx-auto md:mt-32 flex justify-center space-x-16">
      <aside className="lg:w-1/3">
        <div id="notice" className="text-sm text-neutral-300 mb-4 p-4 "></div>

        <h5 className="text-lg uppercase font-medium tracking-wider">
          Categories
        </h5>

        <ul
          className="mt-4 inline-flex flex-wrap gap-1"
          id="categories_container"
        >
          {categories &&
            categories.map((category) => (
              <li
                className="flex items-center space-x-1 bg-neutral-800 p-1 text-xs"
                key={category.id}
              >
                <i className="ph ph-tag-light"></i>
                <span>{category.name}</span>
              </li>
            ))}
        </ul>

        <div className="flex mt-8">
          <input
            type="text"
            className="border border-neutral-400 bg-transparent p-2 px-3 block w-full"
            placeholder="Add a category"
            id="category_field"
          />

          <button
            className="border border-neutral-400 text-white border-l-0 px-4 py-2"
            onClick={handleCategoryCreation}
          >
            Add
          </button>
        </div>
      </aside>

      <form className="lg:w-1/2" onSubmit={handleSubmit}>
        <Link
          href={`/boards/${note.board_id}/notes/${note.id}`}
          className="block duration-200 hover:text-neutral-400"
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
