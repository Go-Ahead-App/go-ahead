import React from "react";

function DetailsSection({ programDetails, setProgramDetails }) {
  function handleSubmit(e) {
    e.preventDefault();

    // Post to the api/v1/programs/:id endpoint
    fetch(`/api/v1/programs/${programDetails.id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(programDetails),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.error) {
          // show error notice
          document.getElementById("error-notice").classList.remove("hidden");
        } else {
          // show success notice
          document.getElementById("success-notice").classList.remove("hidden");
        }

        // hide notices after 3 seconds
        setTimeout(() => {
          document.getElementById("success-notice").classList.add("hidden");
          document.getElementById("error-notice").classList.add("hidden");
        }, 3000);
      });
  }

  return (
    <div>
      <h2 className="font-display">{">> Основні деталі"}</h2>

      <div className="mt-4">
        <label className="block text-sm font-medium text-gray-700">
          Назва програми
        </label>

        <input
          type="text"
          name="name"
          id="name"
          className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-400 duration-200 rounded-md"
          value={programDetails.name}
          onChange={(e) => {
            setProgramDetails({
              ...programDetails,
              name: e.target.value,
            });
          }}
        />
      </div>

      <div className="mt-4">
        <label className="block text-sm font-medium text-gray-700">
          Опис програми
        </label>

        <textarea
          name="description"
          id="description"
          className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-400 duration-200 rounded-md"
          rows="8"
          value={programDetails.description}
          onChange={(e) => {
            setProgramDetails({
              ...programDetails,
              description: e.target.value,
            });
          }}
        />
      </div>

      <div className="mt-4">
        <label className="block text-sm font-medium text-gray-700">
          Складність
        </label>

        <select
          name="difficulty"
          id="difficulty"
          className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-400 duration-200 rounded-md"
          value={programDetails.difficulty || 0}
          onChange={(e) => {
            setProgramDetails({
              ...programDetails,
              difficulty: e.target.value,
            });
          }}
        >
          <option value="0">Легко</option>
          <option value="1">Середньо</option>
          <option value="2">Важко</option>
        </select>
      </div>

      <div className="mt-4">
        <label className="block text-sm font-medium text-gray-700">
          Кількість днів
        </label>

        <input
          type="number"
          name="length"
          id="length"
          className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-400 duration-200 rounded-md"
          value={programDetails.length || 0}
          onChange={(e) => {
            setProgramDetails({
              ...programDetails,
              length: e.target.value,
            });
          }}
        />
      </div>

      <div className="mt-4">
        <button
          type="button"
          className="px-6 py-4 text-sm bg-neutral-100 text-neutral-700 hover:bg-neutral-50 duration-200 cursor-pointer rounded-md"
          onClick={(e) => {
            handleSubmit(e);
          }}
        >
          Зберегти
        </button>
      </div>
    </div>
  );
}

export default DetailsSection;
