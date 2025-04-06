// javac Server.java && java Server [port=8080] [host=127.0.0.1]

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

import java.net.*;
import java.io.*;

public class Server {
  public static void main(String[] argv) throws IOException {
    String host = "127.0.0.1";
    short port = 8080;

    if(argv.length >= 2)
      host = argv[1];

    if(argv.length >= 1)
      port = Short.parseShort(argv[0]);

    HttpServer server = HttpServer.create(new InetSocketAddress(host, port), 0);
    server.createContext("/", new Handler());
    server.setExecutor(null);
    server.start();
    System.out.println("Server listening on " + host + ":" + port);
    System.out.println();
  }

  private static class Handler implements HttpHandler {
    @Override
    public void handle(HttpExchange exchange) throws IOException {
      System.out.print(exchange.getRequestMethod());
      System.out.print(" ");
      System.out.print(exchange.getRequestURI());
      System.out.print(" ");
      System.out.print(exchange.getProtocol());
      System.out.println();

      exchange.getRequestHeaders().forEach((k, vs) -> {
        vs.forEach((v) -> {
          System.out.print(k);
          System.out.print(": ");
          System.out.print(v);
          System.out.println();
        });
      });
      System.out.println();
      exchange.sendResponseHeaders(200, 0);
      exchange.close();
    }
  }
}
