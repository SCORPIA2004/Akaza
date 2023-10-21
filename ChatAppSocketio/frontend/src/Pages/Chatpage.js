import React, { useEffect } from "react";
import axios from "axios";

const Chatpage = () => {
  const PORT = process.env.PORT || 5000;

  const fetchChats = async () => {
    const { data } = await axios.get("http://localhost:${PORT}/api/chat");

    console.log(data);
  };

  useEffect(() => {
    fetchChats();
  }, []);

  return <div>Chats</div>;
};

export default Chatpage;
