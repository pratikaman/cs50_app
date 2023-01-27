
/// this JS script is injected in webviews to remove sidebar
/// from course webpage.
const removeSideBarJS = """
var element = document.getElementsByTagName("aside"), index;
for (index = element.length - 1; index >= 0; index--) {
    element[index].parentNode.removeChild(element[index]);
}
""";
