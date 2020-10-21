// const flatpickr = require("flatpickr");
import flatpickr from "flatpickr";
import "flatpickr/dist/themes/dark.css";



const pickDate = () => {
  flatpickr(".date", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });
};



export { pickDate };
