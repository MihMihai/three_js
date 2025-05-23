part of three_webgl;

class WebGLInfo {
  RenderingContext gl;

  Map<String, int> memory = {
    "geometries": 0, 
    "textures": 0
  };

  Map<String, double> render = {
    "frame": 0.0, 
    "calls": 0.0, 
    "triangles": 0.0, 
    "points": 0.0, 
    "lines": 0.0
  };

  dynamic programs;
  bool autoReset = true;

  WebGLInfo(this.gl);

  void update(count, mode, instanceCount) {
    render["calls"] = render["calls"]! + 1;

    if (mode == WebGL.TRIANGLES) {
      render["triangles"] = render["triangles"]! + instanceCount * (count / 3.0);
    } else if (mode == WebGL.LINES) {
      render["lines"] = render["lines"]! + instanceCount * (count / 2);
    } else if (mode == WebGL.LINE_STRIP) {
      render["lines"] = render["lines"]! + instanceCount * (count - 1);
    } else if (mode == WebGL.LINE_LOOP) {
      render["lines"] = render["lines"]! + instanceCount * count;
    } else if (mode == WebGL.POINTS) {
      render["points"] = render["points"]! + instanceCount * count;
    } else {
      console.warning('three.WebGLInfo: Unknown draw mode: $mode ');
    }
  }

  void reset() {
    render["frame"] = render["frame"]! + 1;
    render["calls"] = 0;
    render["triangles"] = 0;
    render["points"] = 0;
    render["lines"] = 0;
  }

  void dispose(){}
}
