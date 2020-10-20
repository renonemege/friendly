// const flatpickr = require("flatpickr");
import flatpickr from "flatpickr";

const pickDate = () => {
  mode: "range",
    dateFormat: "Y-m-d",
    defaultDate: ["2016-10-10", "2016-10-20"]
        }
};



export { pickDate };