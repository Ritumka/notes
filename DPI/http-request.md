# Anatomy of an HTTP request

**HTTP** stands for **HyperText Transfer Protocol** — it’s the foundation of data communication on the web.

## HTTP is the language that a client and web servers use to talk to each other.

- When you type a URL, or click on a link, or submit a form and hit Enter, your client sends an HTTP request to the server.
- The server sends back an HTTP response, usually containing HTML, CSS, or JSON.
- Your client displays the result.

![client-server](/DPI/images/client-server.png)

_Let’s imagine your browser is a customer in a restaurant. The HTTP request is your order. The server is the kitchen. And the HTTP response is your food._

## HTTP request and response cycle

Requests and responses are plain text files.
Here is how request looks like:

```html
GET /wiki/Chicago HTTP/1.1
Host: en.wikipedia.org
```
The first line is called the request line. It has three parts:

- **Verb:** Specifies the desired action (_e.g., GET, POST, PATCH, DELETE_).
- **Resource path:** Indicates the resource's address (_/wiki/Chicago_).
- **The HTTP version:** In this example, _HTTP/1.1_ (and it's most common used).

Second line are a list of key-value pairs called **headers:** The Host header is required: it specifies the address of the server (in this example, _en.wikipedia.org_).

Wikipedia’s server sends back the response (that is also plain text file ):

```html
HTTP/1.1 200 OK
Content-Type: text/html

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Chicago - Wikipedia</title>

  <!-- Hundreds more lines of HTML describing Chicago -->
```

The first line of the response is the **status line**. It has three parts:
- **The HTTP version** (in this example, **HTTP/1.1**).
- **A status code** (in this example, **200**). Other common [status codes](https://http.cat/):
  - **404** (resource not found), 
  - **500** (internal server error), 
  - **403** (don’t have permission to access), 
  - **302** (“redirect”, or “keep on moving to a different URL”), etc.
- **Reason phrase** which is a description of status code (in this example, **OK**).

Second line has a list of key-value pairs called **headers**.  
The `Content-Type` let the client know what format of the content is being returned (in this example, **text/HTML** (Hypertext Markup Language)).  
After the headers comes a blank line.  
Everything after the blank line is the **body** of the response. In this example, the source code for a whole HTML document about Chicago.  

[Chicago Wikipedia page](https://en.wikipedia.org/wiki/Chicago)