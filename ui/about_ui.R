aboutUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    column(
      width = 4,
      box(
        title = "About Us",
        width = NULL,
        status = "warning",
        solidHeader = TRUE,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever "
      ),
      box(
        title = "",
        width = NULL,
        status = "primary",
        solidHeader = TRUE,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      ),
      box(
        title = "",
        width = NULL,
        status = "primary",
        "Tu można dać grafikę minta"
      )
    ),
    column(
      width = 4,
      box(
        title = "",
        width = NULL,
        status = "primary",
        "Tu można dać grafikę archa"
      ),
      box(
        title = "",
        width = NULL,
        status = "primary",
        solidHeader = TRUE,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      )
    ),
    column(
      width = 4,
      box(
        title = "",
        width = NULL,
        status = "primary",
        solidHeader = TRUE,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      ),
      box(
        title = "",
        width = NULL,
        status = "primary",
        "Tu można dać grafikę ubuntu"
      )
    )
  )
}