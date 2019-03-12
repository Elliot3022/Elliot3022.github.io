nav_class = ->
    nav = (document.querySelector '.nav')
    if window.scrollY == 0 and !nav.classList.contains 'top'
        nav.classList.add 'top'
    else if window.scrollY > 0 and nav.classList.contains 'top'
        nav.classList.remove 'top'
hue_rot = 0
background = (document.querySelector '.background')
window.addEventListener 'scroll', -> 
    nav_class()
    hue_rot = hue_rot + 0.2 % 360
    background.style = 'filter: hue-rotate(' + hue_rot + 'deg)'
window.addEventListener 'load', ->
    nav_class()
    projects = (document.querySelectorAll '.projects .project .expandThis')
    projects.forEach (project) ->
        project.classList.add 'collapsed'
(document.querySelectorAll '.projects .project').forEach (project) ->
    toExpand = (project.querySelector '.expandThis')
    toExpand.setAttribute 'calc-height', toExpand.offsetHeight
    (project.querySelector 'h3').onclick = ->
        if toExpand.classList.contains 'collapsed'
            toExpand.setAttribute 'style', 'height: ' + (toExpand.getAttribute 'calc-height') + 'px;'
        else
            toExpand.setAttribute 'style', ''
        toExpand.classList.toggle 'collapsed'