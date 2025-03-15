
module.export = cds.service.impl( async function () {
    // Get the reference Entity
    const {POs} = this.entities;
    this.on('Add_GrossAmount', async(request, response) => {
        try{
            const id = req.param[0].NODE_KEY;
            console.log("Request - ID : " + req.param[0].NODE_KEY);
            const tx = cds.tx(req);
            this.before();
            await tx.update(POs).with({
                GROSS_AMOUNT : { '+=' : 20000 },
                NOTE: 'Amount Added..!'
            }).where(id);

            let reply = id;
            return reply;
        } catch (error ){
            return "Error : " + error.toString();
        }
    });

    this.on('sum', async(request, response) => {
        let a = request.data.a; let b = request.data.b;
        return a + b;
    });
});