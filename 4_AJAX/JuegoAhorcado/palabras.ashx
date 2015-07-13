<%@ WebHandler Language="C#" Class="palabras" %>

using System;
using System.Web;

using System.Web.Script.Serialization;

public class palabras : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        var palabras = new[] { 
            new {puntos=10, palabra="iglesia"},
            new {puntos=15, palabra="locomotora"},
            new {puntos=3, palabra="paola"},
            new {puntos=5, palabra="esternocleidomastoideo"},
            new {puntos=20, palabra="la casa del arbol"},
            new {puntos=5, palabra="lo que sea"},
        };

        var r = new Random().Next(0, palabras.Length-1);
        context.Response.Write(new JavaScriptSerializer().Serialize(palabras[r]));        
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}