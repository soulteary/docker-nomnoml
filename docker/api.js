/**
 * Refactor nomnoml/api/image.js For NJS
 *
 * @author soulteary
 * @date 2021.01.11
 * @links https://github.com/soulteary/nomnoml/blob/master/api/image.js
 */
var badInput = nomnoml.renderSvg("bad input");

function draw(r) {
  try {
    var input = r.args.source;
    if (!input) {
      return r.return(500, nomnoml.renderSvg(badInput));
    }
    var source = decodeURIComponent(input);
    r.return(200, nomnoml.renderSvg(source));
  } catch (err) {
    ngx.log(ngx.ERR, err);
    return r.return(500, nomnoml.renderSvg(badInput));
  }
}

function version(r) {
  var vers = {
    njs: njs.version,
    graph: graphre.version,
    nomnoml: nomnoml.version,
  };
  r.return(200, JSON.stringify(vers, null, 2));
}

export default { draw, version };
