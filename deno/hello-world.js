import {serve} from "https://deno.land/std@0.50.0/http/server.ts"
const s = serve({port: 8001})
console.log("http://localhost:8001 is where we begin")
for await(const req of s) {
  req.respond({body: "Hello World!\n"})
}

