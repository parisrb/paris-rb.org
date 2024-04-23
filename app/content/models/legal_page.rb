class LegalPage < Sitepress::Model
  collection glob: "legals/*.html*"
  data :title
end
