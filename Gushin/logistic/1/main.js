$(document).ready(function(){
    var width = $(document).width()/2;
    var height = $(document).height()/2;
    var g = new Graph();
    g.edgeFactory.template.style.directed = true;
    g.addEdge("1","2");
    g.addEdge("3","5");
    g.addEdge("4","5");
    g.addEdge("3","1");
    
    var layouter = new Graph.Layout.Ordered(g, topological_sort(g));
    // var layouter = new Graph.Layout.Spring(g);
    
    // layouter.layout();
    var renderer = new Graph.Renderer.Raphael('canvas', g, width, height);
    
})

function getTable(){
    
}