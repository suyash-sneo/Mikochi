import { h } from "preact";
import style from "./style.css";

const Search = ({ searchQuery, setSearchQuery }) => {
  const onSearchInput = (e) => {
    const timer = setTimeout(() => setSearchQuery(e.target.value), 500);
    return () => clearTimeout(timer);
  };

  const onSubmit = (e) => {
    e.preventDefault();
  };

  return (
    <form class={style.container} onSubmit={onSubmit}>
      <input
        class={style.searchInput}
        type="text"
        value={searchQuery}
        onInput={onSearchInput}
        aria-label="search"
      />
      <i class={`${style.searchIcon} gg-search`} />
    </form>
  );
};

export default Search;
