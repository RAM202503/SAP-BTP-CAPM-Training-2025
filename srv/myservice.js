module.exports = function (srv) {
    srv.on('basicCap', function (request) {
       return "Welcome to SAP CAPM, " + request.data.name; 
    });
}