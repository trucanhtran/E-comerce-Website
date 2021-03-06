// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "@fortawesome/fontawesome-free/css/all.css";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

require("jquery");
require("packs/admin/jquery.min");
require("packs/admin/bootstrap.bundle.min");
require("packs/admin/jquery.easing.min");
require("packs/admin/manage_product");
require("packs/admin/search_product");
require("packs/admin/swipe_product");
