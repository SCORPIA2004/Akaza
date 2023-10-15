const express = require("express");
const cors = require("cors");
const { default: axios } = require("axios");

const app = express();
app.use(express.json());
app.use(cors({ origin: true }));

app.post("/authenticate", async (req, res) => {
  const { username } = req.body;
    try
    {
        const r = await axios.put(
            "https://api.chatengine.io/users/",
            { 
                username: username, 
                secret: username, 
                first_name: username },
            { headers: {"PRIVATE-KEY": "acab235f-8447-4de9-baca-af2bd6f4a058 "} }
            );
        return res.status(r.status.json(r.data));
    }
    catch(e)
    {
        if( e.response && (e.response.status === 403 || e.response.status === 401) )
        {
            return res.status(e.response.status).json(e.response.data);
        }
    }
//   return res.json({ username: username, secret: "sha256..." });
});

app.listen(3001);