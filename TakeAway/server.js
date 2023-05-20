const app = require("./app");
const config = require("./app/config");

// Khởi tạo server
const PORT = config.app.port;
app.listen(PORT, () => {
    console.log(`Server in running on post ${PORT}`);
});